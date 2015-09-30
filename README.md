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

* Text analysis with [MonkeyLearn](https://www.monkeylearn.com/ "MonkeyLearn")
* Hosted on [Heroku](https://www.heroku.com/ "Heroku")
* Built on [Ruby on Rails](http://rubyonrails.org/ "rails") and a bit of <a href="https://jquery.com/">jQuery</a>
* [Materialise CSS](http://materializecss.com/ "Materialize") for CSS
* Icons from [Font Awesome](https://fortawesome.github.io/Font-Awesome/icons/ "Font Awesome")
* Fonts from [Google Fonts](https://www.google.com/fonts "Google fonts")
