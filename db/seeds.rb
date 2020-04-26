# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

user = User.create(email: 'user@gmail.com')

movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])

seasons = Season.create([{ title: 'Peaky Blinders', number: 1 },
                         { title: 'Peaky Blinders', number: 2 },
                         { title: 'Money Heist', number: 1 }])

movies.each do |movie|
  Library.create(user_id: user.id, content_id: movie.id)
end

seasons.each do |season|
  Library.create(user_id: user.id, content_id: season.id)
end

number = 0
['Efectuar lo acordado', 'Imprudencias letales', 'Errar al disparar'].each do |title|
  Episode.create(title: title,
                 parent_id: Season.find_by(title: 'Money Heist').id,
                 number: number += 1)
end

['Episode #1.1', 'Episode #1.2', 'Episode #1.3'].each do |title|
  Episode.create(title: title,
                 parent_id: Season.find_by(title: 'Peaky Blinders', number: 1).id,
                 number: number += 1)
end

['Episode #2.1', 'Episode #2.2', 'Episode #2.3'].each do |title|
  Episode.create(title: title,
                 parent_id: Season.find_by(title: 'Peaky Blinders', number: 2).id,
                 number: number += 1)
end
