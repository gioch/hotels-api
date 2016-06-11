class AccomodationTypesController < ApplicationController
  def index
    @accomodation_types = AccomodationType.all

    render json: @accomodation_types, each_serializer: AccomodationTypesSerializer
  end
end
