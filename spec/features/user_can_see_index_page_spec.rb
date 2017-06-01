require 'rails_helper'

describe 'As a user' do
  context 'I go onto the index page' do
    it "I see multiple howlers" do
      user = User.create(name: 'Sample')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      howler   = user.howlers.create(title: 'lemon', text: 'this is the worst lemon')
      howler_1 = user.howlers.create(title: 'lemondrop', text: 'this is the best lemon')

      visit howlers_path

      expect(page).to have_content 'lemon'
      expect(page).to have_content 'lemondrop'
    end
  end
end
