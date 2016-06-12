require 'rails_helper'

describe Hotels::CreateService do
  let(:correct_payload) { correct_params }
  let(:accomodation_type) { create(:accomodation_type) }
  let(:hotel) { create(:hotel) }

  context 'with correct data' do
    it 'should change hotels count by 1' do
      service = service_instance(correct_payload)

      expect { service.perform! }.to change { Hotel.count }.by(1)
    end

    it 'should return result success' do
      service = service_instance(correct_payload)

      expect(service.perform!).to be_kind_of(ResultObjects::Success)
    end

    it 'should return result data to be kind of Hotel' do
      result = service_instance(correct_payload).perform!

      expect(result.data).to be_kind_of(Hotel)
    end

    it 'should have correct inventory data' do
      result = service_instance(correct_payload).perform!

      hotel = result.data

      expect(hotel.name).to eq(correct_payload[:name])
      expect(hotel.address).to eq(correct_payload[:address])
      expect(hotel.star_rating).to eq(correct_payload[:star_rating])
      expect(hotel.accomodation_type_id).to eq(correct_payload[:accomodation_type_id])
    end
  end

  context 'with incorrect data' do
    context 'when accomodation_type is not specified' do
      it 'should not create hotel' do
        service = service_instance(no_accomodation_payload)

        expect { service.perform! }.not_to change { Hotel.count }
      end

      it 'should return result failure' do
        service = service_instance(no_accomodation_payload)

        expect(service.perform!).to be_kind_of(ResultObjects::Failure)
      end

      it 'should return result failure with inventory data' do
        result = service_instance(no_accomodation_payload).perform!

        expect(result.errors).not_to be_empty
      end
    end

    context 'when required param is not specified' do
      it 'should not create hotel' do
        service = service_instance(no_required_param_payload)

        expect { service.perform! }.not_to change { Hotel.count }
      end

      it 'should return result failure' do
        service = service_instance(no_required_param_payload)

        expect(service.perform!).to be_kind_of(ResultObjects::Failure)
      end

      it 'should return result failure with inventory data' do
        result = service_instance(no_required_param_payload).perform!

        expect(result.errors).not_to be_empty
      end
    end
  end

private

  def service_instance(payload)
    described_class.new(payload)
  end

  def correct_params
    {
      name: FactoryGirl.generate(:name),
      address: FactoryGirl.generate(:address),
      star_rating: FactoryGirl.generate(:star_rating),
      accomodation_type_id: accomodation_type.id
    }
  end

  def no_accomodation_payload
    {
      name: FactoryGirl.generate(:name),
      address: FactoryGirl.generate(:address),
      star_rating: FactoryGirl.generate(:star_rating),
    }
  end

  def no_required_param_payload
    {
      address: FactoryGirl.generate(:address),
      star_rating: FactoryGirl.generate(:star_rating),
    }
  end
end
