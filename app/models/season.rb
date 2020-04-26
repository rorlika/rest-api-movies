class Season < Content
  has_many :episodes, class_name: 'Episode', foreign_key: :parent_id

  validates :title, uniqueness: { scope: :number }
end
