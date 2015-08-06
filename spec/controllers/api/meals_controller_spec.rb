require 'spec_helper'

describe API::MealsController, type: :controller do

  render_views

  describe "GET index" do

    before do
      @user = create(:user)
      @meals = create_list(:meal, 7, user: @user)

      sign_in_as_user

      get :index, format: :json
    end

    it "returns a 200" do
      expect(response.status).to be(200)
    end

    it "returns the users meals" do
      expect(json["meals"].length).to eq(@user.meals.length)
    end

    it "returns the users ingredients" do
      expect(json["ingredients"].length).to eq(@user.owned_tags.length)
    end
  end
end
