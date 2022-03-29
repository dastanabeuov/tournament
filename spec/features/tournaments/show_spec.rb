require 'rails_helper'

feature 'Tournaments SHOW', %q{
  Authenticate user can see trournament
  No authenticate user can not see trournament
} do
  
  given(:user) { create(:user) }
  given(:tournament) { create(:tournament, user: user) }
  
  scenario 'Authenticate user can see trournament' do
    sign_in(user)
    visit tournament_path(tournament)
    
    expect(page).to have_content tournament.name
  end

  scenario 'No authenticate user can not see trournament' do
    visit tournament_path(tournament)

    expect(page).to have_content "You need to sign in or sign up before continuing."
    expect(page).to have_current_path user_session_path, ignore_query: true
  end
end