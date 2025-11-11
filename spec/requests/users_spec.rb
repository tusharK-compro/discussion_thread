
require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns a successful response" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) do
        { user: { name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password" } }
      end

      it "creates a new User" do
        expect {
          post users_path, params: valid_attributes
        }.to change(User, :count).by(1)
      end

      it "redirects to the posts page after user creation" do
        post users_path, params: valid_attributes
        expect(response).to redirect_to(posts_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        { user: { name: "", email: "test@example.com", password: "password", password_confirmation: "password" } }
      end

      it "does not create a new User" do
        expect {
          post users_path, params: invalid_attributes
        }.to change(User, :count).by(0)
      end

      it "re-renders the new user template" do
        post users_path, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
