class Hotel < ApplicationRecord
  belongs_to :accomodation_type

  validates :name, presence: true
  validates :address, presence: true
  validates :accomodation_type, presence: true
  validates :star_rating, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 5
  }
end
