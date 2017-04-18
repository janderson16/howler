require "rails_helper"

describe "get tones" do
  it "when user requests /api/v1/tones they are returned json data from the watson api call" do
    VCR.use_cassette('/services/get_tones') do
      get '/api/v1/tones'

      expect(response).to be_success

      tones = JSON.parse(response.body)

      expect(tones.count).to eq(3)
      expect(tones.first.keys.first).to eq("Emotion Tone")
      expect(tones.first["Emotion Tone"].keys.count).to eq(5)
    end
  end
end
