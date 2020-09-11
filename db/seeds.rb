# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = JSON.parse(open(url).read)

json['drinks'].each do |element|
  Ingredient.create!(name: element["strIngredient1"])
end


drinks_url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
drinks_json = JSON.parse(open(drinks_url).read)

drinks_json['drinks'].each do |drink|
  Cocktail.create!(name: drink["strDrink"], image_url: drink["strDrinkThumb"])
end

pp drinks_json
