require 'rails_helper'

feature 'Teams INDEX', %q{
  User can see teams index page
} do
  
  given(:user) { create(:user) }
  given(:tournament) { create(:tournament, user: user) }
  given(:team) { create(:team, user: user, tournament: tournament) }

  background { visit teams_path }

  scenario 'User can see Teams INDEX page' do
    sign_in(user)

    expect(page).to have_content 'Teams'
    expect(page).to have_content team.name
  end
end