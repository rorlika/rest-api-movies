require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe '#title' do
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
