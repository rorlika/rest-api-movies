# frozen_string_literal: true

class Library < ApplicationRecord
  ALIVE = 2.days.ago.freeze

  belongs_to :user
  belongs_to :content

  validates_presence_of :content

  validate :validate_content_id
  scope :alive, -> { where('libraries.created_at >= ?', ALIVE) }
  scope :order_by_created, -> { order(:created_at) }

  validates :content_id, uniqueness: { scope: [:user_id], conditions: -> { alive } }

  private

  def validate_content_id
    return if content.present? && content.type != 'Episode'

    errors.add(:library, 'needs either a movie or a season')
  end
end
