require 'rails_helper'

describe AccomodationType, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:hotels) }
  end
end
