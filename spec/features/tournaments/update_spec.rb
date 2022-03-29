require 'rails_helper'

feature 'Tournament UPDATE', %q(
  AUthor can edit
  Not author can not edit
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:tournament) { create(:tournament, user: user) }

  it 'Author can edit' do
    sign_in(user)
    visit edit_tournament_path(tournament)

    fill_in 'Name', with: 'New tournament name'
    click_on 'Update Tournament'

    expect(page).to have_current_path tournament_path(tournament), ignore_query: true
    expect(page).to have_content 'Tournament successfully updated.'
    expect(page).to have_content 'New tournament name'
  end

  it 'Not author can not edit' do
    sign_in(user2)
    visit edit_tournament_path(tournament)

    expect(page).to have_current_path edit_tournament_path(tournament), ignore_query: true
  end
end