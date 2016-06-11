class Hotels::CreateService
  def initialize(params)
    @params = params
  end

  def perform!
    if accomodation_exists?
      create_hotel!
    else
      accomodation_type_error
    end
  end

private

  def create_hotel!
    @hotel = Hotel.create(@params)

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
