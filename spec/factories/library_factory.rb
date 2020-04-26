# frozen_string_literal: true

FactoryBot.define do
  factory :library do
    content { create(:content) }
    user { create(:user) }
  end
end
