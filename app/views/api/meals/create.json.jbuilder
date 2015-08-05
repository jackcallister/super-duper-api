json.meal do
  json.id @meal.id
  json.name @meal.name

  json.ingredientIds @ingredientIds
end

json.ingredients @meal.ingredients, :id, :name
