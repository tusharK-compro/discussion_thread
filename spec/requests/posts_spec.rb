
require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { User.create!(name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password") }

  before do
    post login_path, params: { email: user.email, password: "password" }
  end

  describe "GET /index" do
    it "returns a successful response" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns a successful response" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end
end
