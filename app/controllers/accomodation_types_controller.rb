class AccomodationTypesController < ApplicationController
  def index
    @accomodations = AccomodationType.all
    
    render json: @accomodations, each_serializer: AccomodationTypesSerializer
  end
end
