json.meals do
  json.array! @meals do |meal|
    json.id meal.id
    json.name meal.name
    json.ingredientIds meal.ingredients.map { |i| i.id }
  end
end

json.ingredients do
  json.array! @ingredients do |ingredient|
    json.id ingredient.id
    json.name ingredient.name
  end
end
