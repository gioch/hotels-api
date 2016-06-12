require 'rails_helper'

describe Hotels::SearchService do
  let(:correct_payload) { correct_params }
  let(:accomodation_type) { create(:accomodation_type) }
  let(:hotel) { create(:hotel) }

  context 'when search query is specified' do
    it 'should return found hotels' do
      hotel1 = create(:hotel)
      hotel2 = create(:hotel, name: 'test')
      hotel3 = create(:hotel, address: 'test')

      result = service_instance(query: 'test').perform!

      expect(result).to include(hotel2, hotel3)
    end
  end

  context 'when search query is not specified' do
    it 'should return all hotels' do
      hotel1 = create(:hotel)
      hotel2 = create(:hotel)

      result = service_instance(params: '').perform!

      expect(result).to include(hotel1, hotel2)
    end
  end

private

  def service_instance(payload)
    described_class.new(payload)
  end
end
