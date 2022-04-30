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

      expect(json_response).to eq({ captions: [] })
    end
  end

  describe "POST /captions" do
    let(:url) { Faker::Internet.url }
    let(:text) { Faker::TvShows::GameOfThrones.quote }
    let(:params) do
      {
        caption: {
          url: url,
          text: text
        }
      }
    end
    it "returns expected response" do
      post '/captions', :params => params

      expect(response).to have_http_status(201)
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:caption]).to match(hash_including(
        {
          url: url,
          text: text
        }
      ))
    end
  end

end
