class API::MealsController < ApplicationController

  # POST /api/meals
  def create
    # temp
    user = User.last

    @meal = user.meals.create(meal_params)

    user.tag(@meal, with: params[:ingredients], on: :ingredients)

    render json: @meal, serializer: MealSerializer, root: nil
  end

  def show
    @meal = Meal.last
    render json: @meal
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
