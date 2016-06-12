require 'rails_helper'

describe HotelsController, type: :controller do
  let(:accomodation_type) { create(:accomodation_type) }
  let(:hotel) { create(:hotel) }

  describe 'GET #index' do
    it 'should get all accomodation types' do
      expect_any_instance_of(Hotels::SearchService)
        .to receive(:perform!).and_call_original

      get :index
    end

    it 'should get all accomodation types' do
      hotel = create(:hotel)

      get :index

      expect(assigns(:hotels)).to eq([hotel])
    end

    it 'should have status success' do
      get :index

      expect(response).to be_success
    end

    skip 'should render correct json' do
      hotel = create(:hotel)

      get :index

      expect(response).to serialize_array([hotel]).with(HotelSerializer)
    end
  end

  describe 'GET #show' do
    context 'with correct data' do
      it 'should show selected hotel' do
        hotel = create(:hotel)

        get :show, params: { id: hotel.id }

        expect(assigns(:hotel)).to eq(hotel)
      end

      it 'should have status success' do
        hotel = create(:hotel)

        get :show, params: { id: hotel.id }

        expect(response).to be_success
      end

      it 'should render correct json' do
        hotel = create(:hotel)

        get :show, params: { id: hotel.id }

        expect(response).to serialize_object(hotel).with(HotelSerializer)
      end
    end

    context 'with incorrect data' do
      it 'should have status unprocessable_entity' do
        get :show, params: { id: 0 }

        expect(response).to have_status(:unprocessable_entity)
      end

      it 'should return errors array' do
        get :show, params: { id: 0 }

        expect(parse_response['errors']).not_to be_empty
      end
    end
  end

  describe 'POST #create' do
    context 'with correct data' do
      it 'should call correct service' do
        expect_any_instance_of(Hotels::CreateService)
          .to receive(:perform!).and_call_original

        post :create, params: correct_create_hotel_params
      end

      it 'should have status success' do
        post :create, params: correct_create_hotel_params

        expect(response).to be_success
      end

      it 'should render correct json' do
        post :create, params: correct_create_hotel_params

        hotel = Hotel.find(parse_response['id'])

        expect(response).to serialize_object(hotel).with(HotelSerializer)
      end
    end

    context 'with incorrect data' do
      it 'should call correct service' do
        expect_any_instance_of(Hotels::CreateService)
          .to receive(:perform!).and_call_original

        post :create, params: incorrect_create_hotel_params
      end

      it 'should have status unprocessable_entity' do
        post :create, params: incorrect_create_hotel_params

        expect(response).to have_status(:unprocessable_entity)
      end

      it 'should return errors array' do
        post :create, params: incorrect_create_hotel_params

        expect(parse_response['errors']).not_to be_empty
      end
    end
  end


  describe 'PUT #update' do
    context 'with correct data' do
      it 'should call correct service' do
        expect_any_instance_of(Hotels::UpdateService)
          .to receive(:perform!).and_call_original

        put :update, params: correct_update_hotel_params
      end

      it 'should have status success' do
        put :update, params: correct_update_hotel_params

        expect(response).to be_success
      end

      it 'should render correct json' do
        put :update, params: correct_update_hotel_params

        hotel = Hotel.find(parse_response['id'])

        expect(response).to serialize_object(hotel).with(HotelSerializer)
      end
    end

    context 'with incorrect data' do
      it 'should call correct service' do
        expect_any_instance_of(Hotels::UpdateService)
          .to receive(:perform!).and_call_original

        put :update, params: incorrect_update_hotel_params
      end

      it 'should have status unprocessable_entity' do
        put :update, params: incorrect_update_hotel_params

        expect(response).to have_status(:unprocessable_entity)
      end

      it 'should return errors array' do
        put :update, params: incorrect_update_hotel_params

        expect(parse_response['errors']).not_to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should call correct method' do
      expect_any_instance_of(Hotel).to receive(:destroy)

      delete :destroy, params: { id: hotel.id }
    end

    it 'should have status success' do
      delete :destroy, params: { id: hotel.id }

      expect(response).to be_success
    end
  end

private

  def correct_create_hotel_params
    {
      hotel: {
        name: FactoryGirl.generate(:name),
        address: FactoryGirl.generate(:address),
        star_rating: FactoryGirl.generate(:star_rating),
        accomodation_type_id: accomodation_type.id
      }
    }
  end

  def incorrect_create_hotel_params
    {
      hotel: {
        name: FactoryGirl.generate(:name),
        address: FactoryGirl.generate(:address),
        star_rating: FactoryGirl.generate(:star_rating)
      }
    }
  end

  def correct_update_hotel_params
    correct_create_hotel_params.merge(id: hotel.id)
  end

  def incorrect_update_hotel_params
    incorrect_create_hotel_params.merge(id: hotel.id)
  end

  def parse_response
    JSON.parse(response.body)
  end
end
