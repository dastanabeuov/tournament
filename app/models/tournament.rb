class Tournament < ApplicationRecord
  belongs_to :user

  has_many :teams
  has_many :games
  
  validates :name, presence: true

  def self.game(tournament)
    Game.new(tournament).call
  end
end
