require 'rails_helper'

describe ApplicationController, type: :controller do

  context 'should handle rescue_from' do
    context 'when parameter is missing' do
      controller(ApplicationController) do
        def index
          raise ActionController::ParameterMissing.new(hotel: {})
        end
      end

      it 'should return errors array' do
        get :index

        expect(parse_response['errors']).not_to be_empty
      end
    end

    context 'when record not found' do
      controller(ApplicationController) do
        def index
          raise ActiveRecord::RecordNotFound.new(hotel: {})
        end
      end

      it 'should return errors array' do
        get :index

        expect(parse_response['errors']).not_to be_empty
      end
    end
  end

private

  def parse_response
    JSON.parse(response.body)
  end
end
