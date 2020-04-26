class Content < ApplicationRecord
  validates_presence_of :title

  scope :order_by_created, -> { order(:created_at) }
end
