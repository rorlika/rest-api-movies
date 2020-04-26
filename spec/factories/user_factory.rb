# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |s| "user_#{s}@mail.com" }
  end
end
