require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe '#title' do
    it { is_expected.to validate_uniqueness_of(:title).scoped_to(:number) }
  end

  describe '#season_id' do
    it { is_expected.to belong_to(:season) }
  end
end
