require 'rails_helper'

RSpec.describe "Captions", type: :request do
  describe "GET /captions" do
    it "works! (now write some real specs)" do
      #get captions_index_path
      get '/captions'
      expect(response).to have_http_status(200)
    end
  end
end
