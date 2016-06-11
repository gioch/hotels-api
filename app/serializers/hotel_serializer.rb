class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :star_rating

  has_one :accomodation_type
end
