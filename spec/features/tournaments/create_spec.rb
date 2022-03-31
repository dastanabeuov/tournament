require 'rails_helper'

feature 'Tournaments CREATE', %q{
  User can create trournament
  User create error field
} do
  
  given(:user) { create(:user) }
  
  background { sign_in(user) }
  background { visit new_tournament_path }

  scenario 'User can create Tournaments' do
    fill_in 'Name', with: 'NewMyString'
    click_on 'Create Tournament'

    expect(page).to have_content 'Tournament successfully created.'    
    expect(page).to have_content 'NewMyString'
  end

  scenario 'User create error field' do
    fill_in 'Name', with: ''
    click_on 'Create Tournament'

    expect(page).to have_content "Name can't be blank"
  end
end