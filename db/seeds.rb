# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
cocktail = Cocktail.new(title: 'NES', body: "A great console")
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

puts "Cleaning database..."
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts "Creating cocktails ..."

%w[ mojito margarita sex_on_the_beach old_fashioned whiskey_sour daiquiri skinny_bitch batida_de_coco ].each do |cocktail|
  cocktail = Cocktail.create!(name: cocktail.humanize)
  puts "Created #{cocktail.name}"
end
puts "Finished!"

%w[ lemon ice mint_leaves orange apple gin vodka sprite lime whiskey cherry ].each do |ingredient|
  ingredient = Ingredient.create!(name: ingredient.humanize)
  puts "Created #{ingredient.name}"
end
puts "Finished!"

Ingredient.all.each do |i|
  Dose.create!(ingredient_id: i.id, cocktail_id: Cocktail.all.sample.id, description: "#{rand(0..80)} description")
end

# Dose.create!(ingredient_id: 1, cocktail_id: 1, description: "15 teaspons")
# Dose.create!(ingredient_id: 2, cocktail_id: 2, description: "10 teaspons")
