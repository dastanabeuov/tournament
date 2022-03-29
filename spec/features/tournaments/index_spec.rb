require 'rails_helper'

feature 'Tournaments INDEX', %q{
  User can see trournament index page
} do
  
  given(:user) { create(:user) }
  
  background { visit root_path }

  scenario 'User can see Tournaments INDEX page' do
    sign_in(user)

    expect(page).to have_content 'Welcome to Tournaments!'
  end
end