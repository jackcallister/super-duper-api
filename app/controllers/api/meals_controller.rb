class API::MealsController < ApplicationController

  # POST /api/meals
  def create
    @meal = current_user.meals.create(meal_params)
    current_user.tag(@meal, with: params[:ingredients], on: :ingredients)
    @ingredientIds = @meal.ingredients.map { |i| i.id }
  end

  def index
    @meals = current_user.meals
    @ingredients = current_user.owned_tags
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
