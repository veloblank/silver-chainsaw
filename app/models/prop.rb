class Prop < ApplicationRecord
  belongs_to :board
  has_many :user_picks
  has_many :users, through: :user_picks
  validates :title, :date, :start_time, :sport, :home_team, :away_team, :board_id, presence: true
  scope :todays_sorted_props, -> {where(:date => "#{DateTime.now.to_date}").order(:start_time)}
  scope :needs_scoring, -> {where(scored_by_admin: false)}



  #this method helps check for duplicates by comparing the object's attributes as a string
  #with other objects in the database
  def gamecast_s
    "Title: #{self.title} on ESPN Gamecast: #{self.espn_game_identifier}"
  end

  def readable_est_time
    start_time.in_time_zone('Eastern Time (US & Canada)').strftime('%l:%M %p')
  end

  def self.filter_and_sort_by_sport(sport)
    Prop.all.where("sport = '#{sport}'").order(:sport)
  end

  def self.uniq_sports
    Prop.select(:sport).map(&:sport).uniq
  end

  def self.filter_and_sort_by_date(date)
    Prop.all.where("date = '#{date}'").order(:start_time)
  end

  def lock_prop
    if start_time <= DateTime.current
      self.update(locked: true)
    end
  end

end
