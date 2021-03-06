# [Sweater Weather](https://github.com/EMielke76/sweater-weather)
![languages](https://img.shields.io/github/languages/top/emielke76/sweater-weather?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/emielke76/sweater-weather)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Table of contents
- [Overview](#overview)
- [Learning Goals](#learning-goals)
- [Database Schema](#db-schema)
- [Setup](#setup)
- [API Setup](#api-setup)
- [Endpoints](#endpoints)
- [Technologies](#technologies)
- [Contributors](#contributors)

## <ins>Overview</ins>

A Backend repository built to consume multiple external API's, aggregate the data, then expose API endpoints to meet the standards and expectations laid out by a ficticious Frontend development team. This reposity was constructed adhering to Service Oriented Architecture best practices. 

This project is based off Turing's Sweater Weather project. More details can be found [here](https://backend.turing.edu/module3/projects/sweater_weather/)

### <ins>Learning Goals</ins>
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

### <ins>DB Schema</ins>
![image](https://user-images.githubusercontent.com/81482407/159509785-a8df082d-2fe4-4a32-81a8-a6fd08139452.png)

### <ins>Setup</ins>
1. Fork and Clone the repo
2. Install gem packages: `$ bundle install`
3. Setup the database: `$ rails db:{drop,create,migrate}`

### <ins>API Setup</ins>
1. Sign up for API keys from the following:
*note* One API key will suffice for both MapQuest endpoints. The links provided will take you to the respective documentation pages.
- MapQuest Geocoding API [here](https://developer.mapquest.com/documentation/geocoding-api/)
- MapQuest Directions API [here](https://developer.mapquest.com/documentation/directions-api/)
- OpenWeather One Call API [here](https://openweathermap.org/api/one-call-api)
- Pexels [here](https://www.pexels.com/api/)
2. From the command line, run the following: `$ bundle exec figaro install`
3. Navigate to /config/application.yml
4. Paste the following code and replace 'YOUR-API-KEY' with the respective credentials:
  ```
  mapquest_id: 'YOUR-API-KEY'
  weather_id: 'YOUR-API-KEY'
  pexels: 'YOUR-API-KEY'
  ```
5. Once your api-keys have been set, navigate to `spec/fixtures` and delete the `vcr_cassettes` directory. This directory will autmoatically repopulate with the next step. 
6. Run `$ bundle exec rspec` to run the full test suite.
7. Open a server with `$ rails s`

### <ins>Endpoints</ins>
Click [here](https://github.com/EMielke76/sweater-weather/blob/main/endpoints.md) for a visual representation of the endpoints and their potential response payloads. 

### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.2
- Rails 5.2.5

#### Development tools employed 
- [Figaro](https://github.com/laserlemon/figaro)
- [Faraday](https://lostisland.github.io/faraday/)
- [PostgreSQL](https://www.postgresql.org/)
- [Postman](https://www.postman.com/)
- [Ruby on Rails](https://rubyonrails.org/)


#### Languages
- Ruby

#### Testing tools
- [Pry](http://pry.github.io/)
- [RSPEC](https://rspec.info/)
- [Shoulda Matchers](https://matchers.shoulda.io/)
- [Simplecov](https://github.com/simplecov-ruby/simplecov)
- [VCR](https://relishapp.com/vcr/vcr/docs)
- [Webmock](https://github.com/bblimke/webmock)

#### Development Principles
- OOP
- TDD
- MVC
- REST

### <ins>Contributors</ins>
- [Eric Mielke](https://github.com/EMielke76)
