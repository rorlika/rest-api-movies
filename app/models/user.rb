class User < ApplicationRecord
  has_many :libraries, -> { alive }, class_name: 'Library'
  has_many :available_contents, through: :libraries, source: :content
  validates :email, presence: true
end
