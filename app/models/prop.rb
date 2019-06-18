class Prop < ApplicationRecord
  belongs_to :board
  has_many :contestant_picks
  has_many :contestants, through: :contestant_picks
  validates :title, :date, :start_time, :sport, :home_team, :away_team, :board_id, presence: true
  scope :todays_props, -> {where(:date => "#{DateTime.now.to_date}")}
  scope :needs_scoring, -> {where(scored_by_admin: false)}



  #this method helps check for duplicates by comparing the object's attributes as a string
  #with other objects in the database
  def gamecast_s
    "Title: #{self.title} on ESPN Gamecast: #{self.espn_game_identifier}"
  end

  def readable_est_time
    start_time.in_time_zone('Eastern Time (US & Canada)').strftime('%l:%M %p')
  end

  def self.filter_by(sport)
    Prop.all.where("sport = '#{sport}'")
  end

end
