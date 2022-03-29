require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tournaments) }

  describe 'method "author_of?":' do
    let(:user) { create(:user) }

    it "valid author" do
      tournament = create(:tournament, user: user )
      expect(user).to be_author_of(tournament)
    end

    it "invalid author" do
      invalid_user = create(:user)
      tournament = create(:tournament, user: user )
      expect(invalid_user).to_not be_author_of(tournament)
    end
  end
end
