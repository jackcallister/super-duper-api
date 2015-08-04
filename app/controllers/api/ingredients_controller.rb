class API::IngredientsController < ApplicationController

  # GET /api/ingredients
  def index
    @ingredients = current_user.owned_tags

    render json: @ingredients, each_serializer: IngredientSerializer, root: nil
  end
end
