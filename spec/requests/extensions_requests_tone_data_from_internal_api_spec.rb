require "rails_helper"

describe "get tones from extension" do
  it "when extension requests /api/v1/tones it returns json data from the watson api call" do
    VCR.use_cassette('/services/request') do
      get '/api/v1/extension?text=something'

      expect(response).to be_success

      tones = JSON.parse(response.body)

      expect(tones.count).to eq(3)
      expect(tones.first.keys.first).to eq("Emotion Tone")
      expect(tones.first["Emotion Tone"].keys.count).to eq(5)

      #As a user using the extension
      #I select text and the extension sends that text through the params
      #And the /extensions endpoint returns JSON
    end
  end
end