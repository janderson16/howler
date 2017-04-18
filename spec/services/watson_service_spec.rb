require "rails_helper"

describe WatsonService do
  it "returns json of tone data" do
    VCR.use_cassette('/services/get_tones') do
      serv = WatsonService.new
      return_data = serv.get_tones
      first_element = return_data.first

      expect(return_data.count).to eq(3)
      expect(first_element[:category_name]).to eq("Emotion Tone")
      expect(first_element[:tones].first[:tone_name]).to eq("Anger")
    end
  end
end
