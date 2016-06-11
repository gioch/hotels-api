FactoryGirl.define do
  factory :hotel do |hotel|
    name
    address
    star_rating
    hotel.accomodation_type { |c| c.association(:accomodation_type) }
  end
end
