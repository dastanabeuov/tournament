class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    team = current_user.teams.new(team_params)
    if team.save
      redirect_to team_path(team)
      flash[:notice] = 'Team successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.author_of?(team) && team.update(team_params)
      redirect_to team_path(team)
      flash[:notice] = 'Team successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    team.destroy if current_user.author_of?(team)
    redirect_to teams_path
    flash[:notice] = 'Team successfully destroyed.'
  end

  private

    def team
      @team ||= params[:id] ? Team.find(params[:id]) : Team.new
    end

    helper_method :team

    def team_params
      params.require(:team).permit(:name, :best, :tournament_id)
    end
end
