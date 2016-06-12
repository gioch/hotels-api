require 'rails_helper'

describe Hotel, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:accomodation_type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:accomodation_type) }
    it {
      is_expected.to validate_numericality_of(:star_rating)
        .is_greater_than_or_equal_to(0)
    }
    it {
      is_expected.to validate_numericality_of(:star_rating)
        .is_less_than_or_equal_to(5)
    }
  end
end
