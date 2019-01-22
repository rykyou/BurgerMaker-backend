class Burger < ApplicationRecord
  has_many :burger_ingredients
  has_many :ingredients, through: :burger_ingredients
end
