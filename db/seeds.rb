# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Cocktails.destroy_all

puts "Creating cocktails ..."
mojito = { name: "Mojito" }
margarita =  { name: "Margarita"}

[ mojito, margarita ].each do |attributes|
  cocktail = Cocktail.create!(attributes)
  puts "Created #{cockktail.name}"
end
puts "Finished!"