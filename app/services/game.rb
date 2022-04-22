class Game
  attr_accessor :teams, :user_id, :tournament_id

  def initialize(tournament)
    @teams = tournament.teams
    @user_id = tournament.user_id
    @tournament_id = tournament.id
  end

  def call
    @teams.shuffle
    group_a = @teams[0..7]
    group_b = @teams[8..-1]
 
    group_a.each do |team_one, team_two|
      Game.create(
          user_id: @user_id,
          tournament_id: @tournament_id,
          group: false, #-----------------group A
          team_one_id: team_one.id,
          team_two_id: team_two.id,
          datetime: Time.now,
          goals_one: rand(0..5),
          goals_two: rand(0..5),

          if goals_one > goals_two
            winner_id: team_one.id
          elsif goals_two > goals_one
            winner_id: team_two.id
          else
            winner_id: 0
          end 
        )

    group_b.each do |team_one, team_two|
      Game.create(
          user_id: @user_id,
          tournament_id: @tournament_id,
          group: true, #-------------------group B
          team_one_id: team_one.id,
          team_two_id: team_two.id,
          datetime: Time.now,
          goals_one: rand(0..5),
          goals_two: rand(0..5),

          if goals_one > goals_two
            winner_id: team_one.id
          elsif goals_two > goals_one
            winner_id: team_two.id
          else
            winner_id: 0
          end 
        )
    end
  end

end