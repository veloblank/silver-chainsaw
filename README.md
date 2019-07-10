# Introduction

Streak on Rails (SoR) was created by a developer with a love of big data and sports. The application emulates a professional application called Streak for the Cash by ESPN. SFTC is a fantasy sports game where contestants try to consecutively select the winners of sports propositions (props) and build the longest streak of the month. The highest streak at the end of the month wins $25,000.

SoR is not a sportsbetting application, but merely a portal for fun, proposition-based picking (sports or otherwise). The application is intended to be a playground for web development and was created and adapted to fulfill the portfolio requirements of Flatiron School's Fullstack Web Development program.

After forking or cloning the repo, ```cd``` into the project directory and run ```bundle install``` in the command line. Create a database using ```rails db:create``` followed by ```rails db:migrate``` and ```rails db:seed``` to create seed data. The ```seed``` command may take a minute as the file generates 30 users and scrapes sports prop data from ESPN and simulates picks for each of the users.

After the seed file has generated the data, start a Rails server in the terminal with ```rails s``` and open localhost:3000 in a browser. The root of the application should open with a front-facing welcome and presentation of the sports props. 3rd party login is possible through Google using OAuth, but all users' accounts created by the seed data can be logged into by looking up the seeded user's username on the Leaderboard and using the password ```1234567890```.

SoR was created with an ```admin``` user, who's password is also ```1234567890```. Using the ```admin``` login, the user can create prop boards, create props, score (grade) the winners of props, and perform other administrator duties of the application.

There can be an extensive amount of "feature creep" in this application. Many initial features were built out to meet the minimum project requirements and then abandoned or changed when "creep" set in. Pull requests against the developer's code are welcomed if there are features that can be implemented or made better. The CRUD nature of the project was intended to be met satisfactorily, but applications such as SoR should protect the scope with which an outside "do-badder" can access the resources that have been brought together by a developer.

## Specifications for the Rails Assessment

https://github.com/veloblank/silver-chainsaw/blob/master/project-spec.md

## Usage

The project is usable in its current form on its master branch. It can be cloned or forked to a local machine. Run bundle install to update all gems, create and seed a database after migrating and use ```rails s``` to start a local server. The application can be accessed at its root '/'.

## Contributing

Bug reports and contributions via raised issues and pull requests are welcomed on GitHub at https://github.com/veloblank/silver-chainsaw. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to a [Contributor Covenant](https://github.com/veloblank/silver-chainsaw/blob/master/CONTRIBUTING.md) code of conduct.

## Developer Disclaimer

This project is not intended to promote wagering on the outcomes of sports or other events. It is intended to be an educational project for object-oriented programming as well as MVC application development. Propositions in the application, while sometimes based on real events and real data, are not intended to encourage wagering on those events, nor sportsbetting in general.

## License

MIT License
Copyright (c) 2019 John Blank

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
