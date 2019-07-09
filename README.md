# Introduction

Streak on Rails (SoR) was created by a developer with a love of big data and sports. The application emulates a professional application called Streak for the Cash by ESPN. SFTC is a fantasy sports game where contestants try to consecutively select the winners of sports propositions (props) and build the longest streak of the month. The highest streak at the end of the month wins $25,000.

SoR is not a sportsbetting application, but merely a portal for fun, proposition-based picking (sports or otherwise). The application is intended to be a playground for web development and was created and adapted to fulfill the portfolio requirements of Flatiron School's Fullstack Web Development program. 

After forking or cloning the repo, ```cd``` into the project directory and run ```bundle install``` in the command line. Create a database using ```rails db:create``` followed by ```rails db:migrate``` and ```rails db:seed``` to create seed data. The ```seed``` command may take a minute as the file generates 30 users and scrapes sports prop data from ESPN and simulates picks for each of the users.

After the seed file has generated the data, start a Rails server in the terminal with ```rails s``` and open localhost:3000 in a browser. The root of the application should open with a front-facing welcome and presentation of the sports props. 3rd party login is possible through Google, but all users' accounts created by the seed data can be logged into by looking up the seeded user's username on the Leaderboard and using the password ```1234567890```.