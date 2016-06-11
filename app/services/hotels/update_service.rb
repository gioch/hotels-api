class Hotels::UpdateService
  def initialize(params)
    @params = params
    @hotel = Hotel.find_by(id: @params[:id])
  end

  def perform!
    if accomodation_exists?
      update_hotel!
    else
      accomodation_type_error
    end
  end

private

  def update_hotel!

    @hotel.update_attributes(@params)

    if @hotel.present? && @hotel.errors.empty?
      ResultObjects::Success.new(@hotel)
    else
      validation_errors
    end
  end

  def accomodation_exists?
    AccomodationType.exists?(id: @params[:accomodation_type_id])
  end

  def accomodation_type_error
    result = ResultObjects::Failure.new('')
    result.errors = [I18n.t('accomodation_not_found')]
    result
  end

  def validation_errors
    result = ResultObjects::Failure.new(@hotel)
    result.errors = @hotel.errors.full_messages
    result
  end
end
