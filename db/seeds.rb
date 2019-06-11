#Prop.all.each {|p| p.destroy}

ESPN = "http://streak.espn.com/en/"
@doc = Nokogiri::HTML(open(ESPN))
props = @doc.css(".matchup-container")
db_props = Prop.all

props.each do |p|
  prop = Prop.new(
    title:  p.css(".gamequestion").text,
    start_time: p.css(".startTime").text,
    sport: p.css(".sport-description").text,
    away_team: p.css("td span strong")[0].text,
    home_team: p.css("td span strong")[1].text
  )
  unless db_props.any? {|db_prop| db_prop.to_s == prop.to_s}
    prop.save
  end
end
