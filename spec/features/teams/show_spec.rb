require 'rails_helper'

feature 'Teams SHOW', %q{
  Authenticate user can see team
  No authenticate user can not see team
} do
  
  given(:user) { create(:user) }
  given(:tournament) { create(:tournament, user: user) }
  given(:team) { create(:team, user: user, tournament: tournament) }
  
  scenario 'Authenticate user can see team' do
    sign_in(user)
    visit team_path(team)
    
    expect(page).to have_content team.name
  end

  scenario 'No authenticate user can not see team' do
    visit team_path(team)

    expect(page).to have_content "You need to sign in or sign up before continuing."
    expect(page).to have_current_path user_session_path, ignore_query: true
  end
end