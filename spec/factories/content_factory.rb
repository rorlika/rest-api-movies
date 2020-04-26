# frozen_string_literal: true

FactoryBot.define do
  factory :content do
    sequence(:title) { |s| "title_#{s}" }
    sequence(:plot) { |s| "plot_#{s}" }
    number { nil }
    type { 'Movie' }
    parent_id { nil }
  end
end
