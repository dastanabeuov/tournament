require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:user) { create(:user) }
  let(:tournament) { create(:tournament, user: user) }
  let(:team) { create(:team, user: user, tournament: tournament) }

  before { login(user) }

  describe 'GET #INDEX' do
    let(:team_1) { create(:team, user: user, tournament: tournament) }
    let(:team_2) { create(:team, user: user, tournament: tournament) }

    before { get :index }

    it 'All teams' do
      expect(assigns(:teams)).to match_array([team_1, team_2])
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #SHOW' do
    before { get :show, params: { id: team } }

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #NEW' do
    before { get :new }

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #EDIT' do
    before { get :edit, params: { id: team } }

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #CREATE' do
    context 'valid attribute' do
      it 'save new team' do
        count = Team.count
        post :create, params: { team: attributes_for(:team) }

        expect(Team.count).to eq count + 1
      end

      it 'redirect show view' do
        post :create, params: { team: attributes_for(:team) }

        expect(response).to redirect_to team_path(Team.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save team' do
        count = Team.count
        post :create, params: { team: attributes_for(:team, :invalid) }

        expect(Team.count).to eq count
      end

      it 'render show new' do
        post :create, params: { team: attributes_for(:team, :invalid) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update team' do
        put :update, params: { id: team, team: attributes_for(:team) }

        expect(assigns(:team)).to eq team
      end

      it 'change team attribute' do
        patch :update, params: { id: team, team: attributes_for(:team, name: 'NewName') }
        team.reload

        expect(team.name).to eq 'NewName'
      end

      it 'redirect update team' do
        patch :update, params: { id: team, team: attributes_for(:team) }

        expect(response).to redirect_to team_path(team)
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change team' do
        patch :update, params: { id: team, team: attributes_for(:team, :invalid) }
        team.reload

        expect(team.name).to have_text team.name
      end

      it 're-render edit view' do
        patch :update, params: { id: team, team: attributes_for(:team, :invalid) }

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:team) { create(:team, user: user, tournament: tournament) }

    it 'delete team' do
      count = Team.count
      delete :destroy, params: { id: team }

      expect(Team.count).to eq count - 1
    end

    it 'redirect index' do
      delete :destroy, params: { id: team }

      expect(response).to redirect_to teams_path
    end
  end
end