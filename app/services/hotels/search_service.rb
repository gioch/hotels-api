class Hotels::SearchService
  def initialize(params)
    @data = params
  end

  def perform!
    hotels = Hotel.all

    if @data[:query].present?
      query = "%#{@data[:query]}%".downcase
      hotels = hotels.where('name iLIKE ? OR address iLIKE ?', query, query)
    end

    hotels
  end
end
