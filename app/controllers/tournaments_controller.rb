class TournamentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @tournaments = Tournament.all
  end

  def show; end

  def edit; end

  def new; end

  def start
  end

  def create
    tournament = current_user.tournaments.new(tournament_params)
    if tournament.save
      redirect_to tournament_path(tournament)
      flash[:notice] = 'Tournament successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.author_of?(tournament) && tournament.update(tournament_params)
      redirect_to tournament_path(tournament)
      flash[:notice] = 'Tournament successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    tournament.destroy if current_user.author_of?(tournament)
    redirect_to root_path
    flash[:notice] = 'Tournament successfully destroyed.'
  end

  private

    def tournament
      @tournament ||= params[:id] ? Tournament.find(params[:id]) : Tournament.new
    end

    helper_method :tournament

    def tournament_params
      params.require(:tournament).permit(:name, :date)
    end
end
