require 'rails_helper'

RSpec.describe Season, type: :model do
  describe '#title' do
    it { is_expected.to validate_uniqueness_of(:title).scoped_to(:number) }
  end
end
