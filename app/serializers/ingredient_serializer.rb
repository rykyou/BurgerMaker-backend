class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url
  has_many :burgers
end
