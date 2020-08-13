# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Cocktails.destroy_all
# Dose.destroy_all
# Ingredient.destroy_all

# puts "Creating cocktails ..."
# mojito = { name: "Mojito" }
# margarita =  { name: "Margarita"}

# [ mojito, margarita ].each do |attributes|
#   cocktail = Cocktail.create!(attributes)
#   puts "Created #{cockktail.name}"
# end

require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'
result = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

drinks.each do |item|
  item.each do |a, b|
    Ingredient.create(name: b)
  end
end
puts 'Finished!'