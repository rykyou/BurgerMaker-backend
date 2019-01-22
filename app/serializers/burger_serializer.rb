class BurgerSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner_name
  has_many :ingredients
end
