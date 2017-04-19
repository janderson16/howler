class WatsonService

  def get_tones(text)
    new_text = swap_space(text)

    parse(HTTParty.get("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-1919&text=#{new_text}",
                        basic_auth: { username: ENV['WATSON_USERNAME'], password: ENV['WATSON_PASSWORD'] }
                        ))[:document_tone][:tone_categories]

  end

  private

  def swap_space(words)
    words.gsub(/[^a-zA-Z0-9\-\s.?!]/,"") 
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
