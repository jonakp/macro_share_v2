require 'rails_helper'

RSpec.describe "Foodhistories", type: :request do
  describe "GET /foodhistories" do
    it "works! (now write some real specs)" do
      get foodhistories_path
      expect(response).to have_http_status(200)
    end
  end
end
