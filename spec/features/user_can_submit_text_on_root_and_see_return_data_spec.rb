require 'rails_helper'

describe 'when user is on root they are able to fill out a form' do
    it 'when they hit enter they see the data from the tone analysis' do
        VCR.use_cassette('/services/user_submit') do
            visit root_path

            fill_in :text, with: 'I hate cheese'
            click_on('Submit')

            expect(page).to have_content('Emotional Tones')
            expect(page).to have_content('Language Tones')
            expect(page).to have_content('Social Tones')
        end
    end
end
