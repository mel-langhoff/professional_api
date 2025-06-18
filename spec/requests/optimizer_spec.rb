require 'rails_helper'

RSpec.describe "Optimizers", type: :request do
  describe "GET /new" do
    xit "returns http success" do
      get "/optimizer/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /optimize" do
    xit "returns http success" do
      get "/optimizer/optimize"
      expect(response).to have_http_status(:success)
    end
  end

end
