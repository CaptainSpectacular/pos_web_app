# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file   = File.read('./db/data/all_cards.json')
parsed = JSON.parse(file)
position = 1
total = file.size 

parsed.each do |k, v|
  Card.create(name: k,
              description: v['text'])
  puts "Creating #{position}/#{total}" 
  position += 1
end
