class Tone

  def self.get(text)
    serv = WatsonService.new
    tones = []
    serv.get_tones(text).each do |tone_data|
      tone_categories = Hash.new
      tone_hash = Hash.new
      tone_data[:tones].each do |tone_info|
        tone_hash[tone_info[:tone_name]] = tone_info[:score]
      end
      tone_categories[tone_data[:category_name]] = tone_hash
      tones << tone_categories
    end
    tones
  end

end
