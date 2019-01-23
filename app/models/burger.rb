class Burger < ApplicationRecord
  has_many :burger_ingredients
  has_many :ingredients, through: :burger_ingredients

  def addIngredients(ingredients_ids_array)
    ingredients_ids_array.each do |ingredient_id|
      self.ingredients << Ingredient.find(ingredient_id)
    end
  end

  def updateIngredients(ingredients_ids_array)
    self.ingredients = []
    ingredients_ids_array.each do |ingredient_id|
      self.ingredients << Ingredient.find(ingredient_id)
    end
  end
end
