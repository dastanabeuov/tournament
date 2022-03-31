require 'rails_helper'

feature 'Team UPDATE', %q(
  AUthor can edit
  Not author can not edit
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:tournament) { create(:tournament, user: user)}
  let(:team) { create(:team, user: user, tournament: tournament) }

  it 'Author can edit' do
    sign_in(user)
    visit edit_team_path(team)

    fill_in 'Name', with: 'New team name'
    click_on 'Update Team'

    expect(page).to have_current_path team_path(team), ignore_query: true
    expect(page).to have_content 'Team successfully updated.'
    expect(page).to have_content 'New team name'
  end

  it 'Not author can not edit' do
    sign_in(user2)
    visit edit_team_path(team)

    expect(page).to have_current_path edit_team_path(team), ignore_query: true
  end
end