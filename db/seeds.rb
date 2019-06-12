#Prop.all.each {|p| p.destroy}

#--------------Can be used to scrape historical data/props
# date = Date.today.strftime('%Y%m%d')
# change 'date' to_i and subtract number of days and scrape historical
# ESPN = "http://fantasy.espn.com/streak/en/entry?date=#{date}"
#-----------------------------------------------------

ESPN = "http://fantasy.espn.com/streak/en/"
@doc = Nokogiri::HTML(open(ESPN))
props = @doc.css(".matchup-container")

props.each do |p|
  date = p.css(".startTime").attr("data-locktime").value
  board_name = DateTime.parse(date).strftime('%Y%m%d')
  board = Board.find_or_create_by(name: board_name)
  binding.pry
  prop = Prop.new(
    title:  p.css(".gamequestion").text,
    start_time: DateTime.parse(date),
    sport: p.css(".sport-description").text,
    away_team: p.css("td span strong")[0].text,
    home_team: p.css("td span strong")[1].text,
    board_id: board.id
  )
  if p.css(".matchupStatus a").attr("href")
    prop.espn_game_identifier = p.css(".matchupStatus a").attr("href").value
  else
    prop.espn_game_identifier = "Postponed"
  end

  unless Prop.all.any? {|db_prop| db_prop.gamecast_s == prop.gamecast_s}
    prop.save
  end
end

#Faker Contestant Data
# 10.times do
#   email = Faker::Internet.free_email
#   username = Faker::Internet.username
#   password = Faker::Internet.password(8)
#   Contestant.create(email: email, username: username, password_digest: password)
# end
