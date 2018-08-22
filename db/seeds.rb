# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file   = File.read('./db/data/UST.json')
parsed = JSON.parse(file)
position = 1

parsed["cards"].each do |k|
  Card.create(name: k["name"],
              description: k["text"])
  puts "Creating #{position}: #{k["name"}" 
  position += 1
end
puts "Done!"
