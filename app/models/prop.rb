class Prop < ApplicationRecord
  belongs_to :board
  has_many :contestant_picks
  has_many :contestants, through: :contestant_picks
  validates :title, :start_time, :sport, :home_team, :away_team, :board_id, presence: true


  #this method helps check for duplicates by comparing the object's attributes as a string
  #with other objects in the database
  def gamecast_s
    "Title: #{self.title} on ESPN Gamecast: #{self.espn_game_identifier}"
  end

  def readable_time
    start_time.strftime('%l:%M %p')
  end

end
