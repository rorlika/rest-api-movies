require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    it { is_expected.not_to allow_value('').for(:email) }
    it { is_expected.to allow_value('a@b.com').for(:email) }
  end
end
