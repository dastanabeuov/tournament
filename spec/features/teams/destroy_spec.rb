require 'rails_helper'

feature 'Team DESTROY', %q(
  Author destroy
  Not author can not destroy
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:tournament) { create(:tournament, user: user) }
  let(:team) { create(:team, user: user, tournament: tournament) }

  it 'Author destroy' do
    sign_in(user)
    visit teams_path
    
    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Team successfully destroyed.'
  end

  it 'Not author can not destroy' do
    sign_in(user2)
    visit teams_path

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end