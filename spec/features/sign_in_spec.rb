require 'rails_helper'

feature 'User can signin', %q{
  User tries sign in
  User sign out
} do
  
  given(:user) { create(:user) }
  
  background { visit new_user_session_path }

  scenario 'User tries sign in' do
    sign_in(user)

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'User sign out' do
    sign_in(user)
    
    visit root_path
    click_on 'sign out'
    
    expect(page).to have_content 'Signed out successfully.'
  end
end