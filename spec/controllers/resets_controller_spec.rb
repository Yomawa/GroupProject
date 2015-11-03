require 'rails_helper'

RSpec.describe ResetsController, type: :controller do

  describe "GET #new," do
    it "returns http success" do
      get :new,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create," do
    it "returns http success" do
      get :create,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit," do
    it "returns http success" do
      get :edit,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update," do
    it "returns http success" do
      get :update,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_params" do
    it "returns http success" do
      get :user_params
      expect(response).to have_http_status(:success)
    end
  end

end
