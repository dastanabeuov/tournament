class Services::Game
  attr_accessor :user_id, :tournament_id, :team_one_id, :team_two_id, :datetime, :tour, :goals_one, :goals_two

  def initialize(object)
    @user_id = object.user_id
    @tournament_id = object.tournament_id
    @team_one_id = team_one_id
    @team_two_id = team_two_id
    @datetime = datetime
    @tour = tour
    @goals_one = goals_one
    @goals_two = goals_two
  end

  def call
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s).first
    return authorization.user if authorization

    email = auth.info[:email]
    user = User.where(email: email).first
    if user
      user.create_authorization(auth)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, password: password, password_confirmation: password)
      user.create_authorization(auth)
    end

    user
  end
end