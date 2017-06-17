[![Code Climate](https://codeclimate.com/github/ruba-ruba/sinatra-setup/badges/gpa.svg)](https://codeclimate.com/github/ruba-ruba/sinatra-setup)
[![Test Coverage](https://codeclimate.com/github/ruba-ruba/sinatra-setup/badges/coverage.svg)](https://codeclimate.com/github/ruba-ruba/sinatra-setup/coverage)
[![Build Status](https://travis-ci.org/ruba-ruba/sinatra-setup.svg?branch=master)](https://travis-ci.org/ruba-ruba/sinatra-setup)

#### Sinatra Setup

The complete sinatra (*mvc) boilerplate ready for building simple applications.

##### Requirements

ruby 2.4.1

##### Components

  | Component      | Source |
  | -------------- |--------|
  | authentication | [Warden](https://github.com/hassox/warden) |
  | orm            | [Sequel](http://sequel.jeremyevans.net/)   |
  | database       | [SQLite](https://www.sqlite.org/)          |
  | testing        | [RSpec](http://rspec.info/), [FactoryGirl](https://github.com/thoughtbot/factory_girl) |
  | server         | [puma](http://puma.io/)                    |
  | views          | [Haml](http://haml.info/)                  |
  | styling        | [Bootstrap](http://getbootstrap.com/)      |
  |                | [bundler](http://bundler.io/)              |

##### Startup

- server:
  - shotgun config.ru --server=puma --port=9292
  - puma config.ru
- tests:
  - rspec
  - COVERAGE=true rspec

##### TODO

- add background (jobs/queus)
- add search engine (elastic/*)
- add caching (redis/memcached)
- more robust authentication (+OAuth)
- add migrations support & remove dummy schema
- add api namespace

##### License

[MIT](https://opensource.org/licenses/MIT)
