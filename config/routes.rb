Rails.application.routes.draw do
  scope '/api' do
    resources :accomodation_types, only: [:index]
    resources :hotels
  end
end
