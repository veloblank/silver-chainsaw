class Prop < ApplicationRecord

  def to_s
    "Title: #{@title}, #{away_team} @#{home_team} being played at #{@start_time}"
  end

end
