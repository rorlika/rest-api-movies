class Episode < Content
  belongs_to :season, class_name: 'Season', foreign_key: :parent_id

  validates :title, uniqueness: { scope: :number }
  validates_presence_of :season
end
