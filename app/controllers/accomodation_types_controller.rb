class AccomodationTypesController < ApplicationController
  def index
    @accomodation_types = AccomodationType.all

    render json: { data: @accomodation_types }
  end
end
