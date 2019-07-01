#-------Can be used to scrape historical data/props to seed db
#--------------------------------------------------------------
DAYS_OF_HISTORICAL_DATA = 5
# change the value of this constant to scrape more or less past days of historical ESPN props


now = DateTime.now
x_days_ago = now - DAYS_OF_HISTORICAL_DATA
ary = Array.new(DAYS_OF_HISTORICAL_DATA).map.with_index(1) {|_,index| (x_days_ago + index).strftime('%Y%m%d')}
#builds an array of strings formatted as: ["20190603", "20190604", "20190605"......]

ary.each do |i|
  espn = "http://fantasy.espn.com/streak/en/entry?date=#{i}"
  @doc = Nokogiri::HTML(open(espn))
  props = @doc.css(".matchup-container")

  props.each do |p|
    date = p.css(".startTime").attr("data-locktime").value
    board_name = DateTime.parse(date).strftime('%Y%m%d')
    board = Board.find_or_create_by(name: board_name)
    prop = Prop.new(
      title:  p.css(".gamequestion").text,
      date: DateTime.parse(date).in_time_zone('Eastern Time (US & Canada)').to_date,
      start_time: DateTime.parse(date).in_time_zone('Eastern Time (US & Canada)'),
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

end

#-----------------------------------Faker Contestant Data
10.times do
  email = Faker::Internet.free_email
  username = Faker::Internet.username
  password = Faker::Internet.password(8)
  User.create(email: email, username: username, password_digest: password)
end

# make an Admin on db:seed

User.create(email: "email@gmail.com", username: "admin", password: "1234567890", admin: true)
