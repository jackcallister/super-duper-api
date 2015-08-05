class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredient_ids

  def ingredient_ids
    object.ingredients.map { |i| i.id }
  end
end
