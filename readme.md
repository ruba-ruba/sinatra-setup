##### Sinatra boilerplate

The complete sinatra (*mvc) boilerplate ready for building simple applications

##### Requirements

ruby 2.4.1

##### Components

- authentication: Warden
- orm: Sequel
- database: SQLite
- testing:
  - RSpec
  - FactoryGirl
- server: puma
- views: Haml
- styling: Bootstrap
- bundler

##### Startup

- shotgun --server=puma --port=9292 config.ru
- puma/rackup config.ru

##### TODO

- add background jobs / queues
- add search engine
- add caching

##### License
