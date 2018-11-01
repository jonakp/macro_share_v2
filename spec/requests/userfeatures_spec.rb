require 'rails_helper'

RSpec.describe "Userfeatures", type: :request do
  describe "GET /userfeatures" do
    it "works! (now write some real specs)" do
      get userfeatures_path
      expect(response).to have_http_status(200)
    end
  end
end
