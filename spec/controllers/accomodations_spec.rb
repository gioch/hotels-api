require 'rails_helper'

describe AccomodationTypesController, type: :controller do
  describe 'GET #index' do
    it 'should all accomodation types' do
      accomodation = create(:accomodation_type)

      get :index

      expect(assigns(:accomodations)).to eq([accomodation])
    end


    it 'should have status success' do
      get :index

      expect(response).to be_success
    end

    skip 'should render correct json' do
      accomodation = create(:accomodation_type)

      get :index

      expect(response).to serialize_array([accomodation])
        .with(AccomodationTypesSerializer)
    end
  end

  def parse_response
    JSON.parse(response.body)
  end
end
