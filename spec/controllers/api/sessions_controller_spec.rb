require 'spec_helper'

describe API::SessionsController, type: :controller do
  render_views

  describe "POST create" do

    let!(:user) do
      create :user, password: "password", password_confirmation: "password"
    end

    context "with a valid user" do

      before  do
        post :create, format: :json, email: user.email, password: "password"
      end

      it "signs in" do
        expect(response.status).to be(200)
      end

      it "returns an access_token" do
        expect(json["user"]["access_token"]).to eq(user.access_token)
      end
    end

    context "with an invalid user" do

      before do
        post :create, format: :json, email: user.email, password: "wrong_password"
      end

      it "does not sign in" do
        expect(response.status).to be(422)
      end

      it "returns invalid login attempt" do
        expect(json["error"]).to eq("Invalid login attempt")
      end
    end
  end
end
