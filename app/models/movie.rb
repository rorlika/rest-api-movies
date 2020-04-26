class Movie < Content
  validates :title, uniqueness: true
end

