require "rails_helper"

describe Tone do
  it "formats returned hash from API call" do
    return_data = [{tones:
                            [{score: 0.099458,
                              tone_id: "anger",
                              tone_name: "Anger"},
                             {score: 0.036908,
                               tone_id: "disgust",
                               tone_name: "Disgust"},
                             {score: 0.234002,
                              tone_id: "fear",
                              tone_name: "Fear"},
                             {score:0.281713,
                              tone_id: "joy",
                              tone_name: "Joy"},
                             {score:0.213044,
                              tone_id: "sadness",
                              tone_name: "Sadness"}],
                              
                    category_id:"emotion_tone",
                    category_name: "Emotion Tone"}]

    allow_any_instance_of(WatsonService).to receive(:get_tones).and_return(return_data)

    tones = Tone.get("I like stuff")

    expect(tones.count).to eq(1)
    expect(tones.first["Emotion Tone"].keys.count).to eq(5)
    expect(tones.first["Emotion Tone"].keys.first).to eq("Anger")
  end
end
