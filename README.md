# [Sweater Weather](https://github.com/EMielke76/sweater_weather)

## Table of contents
- [Overview](#overview)
- [Setup](#setup)
- [API Setup](#api-setup)
- [Endpoints](#endpoints)
- [Technologies](#technologies)
- [Contributors](#contributors)

## <ins>Overview</ins>

A Backend repository built to consume multiple external API's, aggregate the data, then expose API endpoints to meet the standards and expectations laid out by a ficticious Frontend development team. This reposity was constructed adhering to Service Oriented Architecture best practices. 

This project is based off Turing's Sweater Weather project. More details can be found [here](https://backend.turing.edu/module3/projects/sweater_weather/)

### <ins>Setup</ins>
1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate}`
4. Run `bundle exec rspec` to test

### <ins>API Setup</ins>
1. Sign up for API keys from the following:
*note* One API key will suffice for both MapQuest endpoints. The liks provided will take you to the respective documentation pages.
- MapQuest Geocoding API [here](https://developer.mapquest.com/documentation/geocoding-api/)
- MapQuest Directions API [here](https://developer.mapquest.com/documentation/directions-api/)
- OpenWeather One Call API [here](https://openweathermap.org/api/one-call-api)
- Pexels [here](https://www.pexels.com/api/)
2. From the command line, run the following: `bundle exec figaro install`
3. Navigate to /config/application.yml
4. Paste the following code and replace 'YOUR-API-KEY' with the respective credentials:
  ```
  MAPQUEST_KEY: 'YOUR-API-KEY'
  OPEN_WEATHER_KEY: 'YOUR-API-KEY'
  UNSPLASH_KEY: 'YOUR-API-KEY'
  ```

### <ins>Endpoints</ins>
[Endpoints](https://github.com/EMielke76/sweater-weather/blob/main/endpoints.md)

### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.2
- Rails 5.2.5

#### Development tools employed 
- [Figaro](https://github.com/laserlemon/figaro)
- [PostgreSQL](https://www.postgresql.org/)
- [Postman](https://www.postman.com/)
- [Ruby on Rails](https://rubyonrails.org/)
- [Faraday](https://lostisland.github.io/faraday/)

#### Languages
- Ruby

#### Testing
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
