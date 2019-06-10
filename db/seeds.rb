require 'nokogiri'
require 'open-uri'

Prop.all.each {|p| p.destroy}

ESPN = "http://streak.espn.com/en/"
@doc = Nokogiri::HTML(open(ESPN))
props = @doc.css("div .matchup-container")

props.each do |p|
  prop = Prop.create(
    title:  p.css(".gamequestion").text,
    start_time: p.css("div .startTime").text,
    sport: p.css(".sport-description").text,
    away_team: p.css("td span strong")[0].text,
    home_team: p.css("td span strong")[1].text
  )
end
