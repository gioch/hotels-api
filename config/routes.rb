Rails.application.routes.draw do
  scope '/api' do
    get 'suggestions', to: 'hotels#suggestions'

    resources :accomodation_types, only: [:index]
    resources :hotels
  end
end
