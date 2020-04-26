class Season < Content
  has_many :episodes, class_name: 'Episode', foreign_key: :parent_id

  validates :title, uniqueness: { scope: :number }

  def self.with_episodes
    sql = <<~SQL
      WITH RECURSIVE nodes(id,title,type,parent_id,created_at) AS (
        (SELECT s1.id, s1.title, s1.type, s1.parent_id, s1.created_at
        FROM contents s1 WHERE type = 'Season'
        ORDER BY s1.created_at)
            UNION
        (SELECT s2.id, s2.title, s2.type, s2.parent_id, s2.created_at
        FROM contents s2, nodes s1 WHERE s2.parent_id = s1.id
        ORDER BY s2.title)
      )
      SELECT * FROM nodes;
    SQL

    ActiveRecord::Base.connection.select_all(sql)
  end
end
