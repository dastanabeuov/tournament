require 'rails_helper'

feature 'Teams CREATE', %q{
  User can create team
  User create error field
} do
  
  given(:user) { create(:user) }
  given(:tournament) { create(:tournament, user: user) }
  
  background { sign_in(user) }
  background { visit new_team_path }

  scenario 'User can create Teams' do
    fill_in 'Name', with: 'NewMyString'
    fill_in 'Tournament select', with: tournament
    click_on 'Create Team'

    expect(page).to have_content 'Team successfully created.'    
    expect(page).to have_content 'NewMyString'
  end

  scenario 'User create error field' do
    fill_in 'Name', with: ''
    fill_in 'Tournament select', with: tournament
    click_on 'Create Team'

    expect(page).to have_content "Name can't be blank"
  end
end