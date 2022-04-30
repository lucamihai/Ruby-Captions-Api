require 'rails_helper'
require 'json'

RSpec.describe "Captions", type: :request do
  describe "GET /captions" do
    it "returns status code 200" do
      get '/captions'
      expect(response).to have_http_status(200)
    end

    it "returns expected entities" do
      get '/captions'

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to eq(
        {
          captions: [
            {
              id: 1,
              url: "https://example.com/image.png",
              text: "Hello World",
              caption_url: ""
            },
            {
              id: 124,
              url: "",
              text: "",
              caption_url: ""
            }
          ]
        }
      )
    end
  end

  
end
