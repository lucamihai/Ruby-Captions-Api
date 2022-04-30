require 'rails_helper'
require 'json'

RSpec.describe "Captions", type: :request do
  describe "when creating a caption" do
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
    context "when requesting all captions" do
      it "contains newly created caption" do
        post '/captions', :params => params
        get '/captions'

        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(json_response[:captions].first).to match(hash_including(
          {
            url: url,
            text: text
          }
        ))
      end
    end
  end
end
