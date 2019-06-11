class Prop < ApplicationRecord


  #this method helps check for duplicates by comparing the object's attributes as a string
  #with other objects in the database
  def gamecast_s
    "Title: #{self.title} on ESPN Gamecast: #{self.espn_game_identifier}"
  end

end
