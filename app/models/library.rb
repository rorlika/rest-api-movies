# frozen_string_literal: true

class Library < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates_presence_of :content

  validate :validate_content_id
  validate :validate_existed_content

  scope :overlapping, lambda { |user_id, content_id|
    where(user_id: user_id, content_id: content_id, created_at: 2.days.ago...Time.current)
  }

  private

  def validate_existed_content
    if Library.overlapping(user_id, content_id).exists?
      errors.add(:content, 'is already purchased')
    end
  end

  def validate_content_id
    return if content.present? && content.type != 'Episode'

    errors.add(:library, 'needs either a movie or a season')
  end
end
