class HotelsController < ApplicationController
  before_action :set_hotel, except: [:index, :create, :suggestions]

  def suggestions
    @hotels = Hotels::SearchService.new(params).perform!

    render json: @hotels, each_serializer: SuggestionSerializer, search_string: params[:query]
  end

  def index
    @hotels = Hotels::SearchService.new(params).perform!

    render json: @hotels, each_serializer: HotelSerializer
  end

  def show
    render json: @hotel
  end

  def create
    result = Hotels::CreateService.new(hotel_params).perform!

    if result.success?
      render json: result.data
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def update
    result = Hotels::UpdateService.new(hotel_update_params).perform!

    if result.success?
      render json: result.data
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel.destroy

    if @hotel.destroyed?
      render json: { success: true }
    else
      render json: { errors: @hotel.errors }, status: :unprocessable_entity
    end
  end

private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(
      :name, :address, :star_rating, :accomodation_type_id
    )
  end

  def hotel_update_params
    hotel_params.merge(id: params[:id])
  end
end
