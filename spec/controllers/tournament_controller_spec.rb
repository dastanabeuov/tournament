require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do
  let(:user) { create(:user) }
  let(:tournament) { create(:tournament, user: user) }

  before { login(user) }

  describe 'GET #INDEX' do
    let(:tournament_1) { create(:tournament, user: user) }
    let(:tournament_2) { create(:tournament, user: user) }

    before { get :index }

    it 'All tournaments' do
      expect(assigns(:tournaments)).to match_array([tournament_1, tournament_2])
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #SHOW' do
    before { get :show, params: { id: tournament } }

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
    before { get :edit, params: { id: tournament } }

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #CREATE' do
    context 'valid attribute' do
      it 'save new tournament' do
        count = Tournament.count
        post :create, params: { tournament: attributes_for(:tournament) }

        expect(Tournament.count).to eq count + 1
      end

      it 'redirect show view' do
        post :create, params: { tournament: attributes_for(:tournament) }

        expect(response).to redirect_to tournament_path(Tournament.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save tournament' do
        count = Tournament.count
        post :create, params: { tournament: attributes_for(:tournament, :invalid) }

        expect(Tournament.count).to eq count
      end

      it 'render show new' do
        post :create, params: { tournament: attributes_for(:tournament, :invalid) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update tournament' do
        put :update, params: { id: tournament, tournament: attributes_for(:tournament) }

        expect(assigns(:tournament)).to eq tournament
      end

      it 'change tournament attribute' do
        patch :update, params: { id: tournament, tournament: attributes_for(:tournament, name: 'NewName') }
        tournament.reload

        expect(tournament.name).to eq 'NewName'
      end

      it 'redirect update tournament' do
        patch :update, params: { id: tournament, tournament: attributes_for(:tournament) }

        expect(response).to redirect_to tournament_path(tournament)
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change tournament' do
        patch :update, params: { id: tournament, tournament: attributes_for(:tournament, :invalid) }
        tournament.reload

        expect(tournament.name).to have_text tournament.name
      end

      it 're-render edit view' do
        patch :update, params: { id: tournament, tournament: attributes_for(:tournament, :invalid) }

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:tournament) { create(:tournament, user: user) }

    it 'delete tournament' do
      count = Tournament.count
      delete :destroy, params: { id: tournament }

      expect(Tournament.count).to eq count - 1
    end

    it 'redirect index' do
      delete :destroy, params: { id: tournament }

      expect(response).to redirect_to root_path
    end
  end
end