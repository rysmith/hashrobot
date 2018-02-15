![Hash Robot](https://raw.githubusercontent.com/rysmith/hashrobot/master/app/assets/images/hashrobot_sm.png)
[![Build Status](https://travis-ci.org/rysmith/hashrobot.svg?branch=master)](https://travis-ci.org/rysmith/hashrobot)

# HashRobot
A social media assistant.

## Goal
HashRobot is your personal marketing consultant.
HashRobot will give the most visible and used hashtags in each category. Adding these hashtags to your tweets will give social media users an edge in getting views and gaining followers.
HashRobot makes it easy for you to tweet right from our hash dash!

## Design
HashRobot is designed to process large numbers of current and popular tweets from Twitter's API.
HashRobot then passes them to the MonkeyLearn API to gain data and relevant categories for a each tweet.
HashRobot reivews the results applies its proprietary algorithm then finds the most valuable hash tags for a each category at a given moment.
These hashtags can then be used to raise your social media profile!

## Architecture

* Text analysis with [MonkeyLearn](http://www.monkeylearn.com/ "MonkeyLearn")
* Data from [Twitter](https://twitter.com/ "Twitter")
* Hosted on [Heroku](https://www.heroku.com/ "Heroku")
* Built on [Ruby on Rails](http://rubyonrails.org/ "Rails") with a bit of <a href="https://jquery.com/">jQuery</a>
* [Materialise CSS](http://materializecss.com/ "Materialize") for CSS
* Icons from [Font Awesome](https://fortawesome.github.io/Font-Awesome/icons/ "Font Awesome")
* Fonts from [Google Fonts](https://www.google.com/fonts "Google fonts")

## License
Copyright (C) 2015 Ryan Smith, Jeff Demers, Chris Wu

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
