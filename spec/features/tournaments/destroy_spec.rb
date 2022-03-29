require 'rails_helper'

feature 'Tournament DESTROY', %q(
  Author destroy
  Not author can not destroy
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:tournament) { create(:tournament, user: user) }

  it 'Author destroy' do
    sign_in(user)
    visit root_path
    
    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Tournament successfully destroyed.'
  end

  it 'Not author can not destroy' do
    sign_in(user2)
    visit root_path

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end