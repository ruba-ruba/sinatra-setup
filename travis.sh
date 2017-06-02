#!/usr/bin/env bash

echo "bundle"
bundle install
echo "creating test db"
bundle exec rake db:test:setup
if [ ! -f ./db/test.db ]; then
  echo "Database wasn't created"
else
  echo "Created test database"
fi
echo "running specs"
bundle exec rspec
