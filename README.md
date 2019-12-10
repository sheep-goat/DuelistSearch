# Duelist Search

This application is for TCG players to search for opponents.

## Requirements
* Ruby 2.4.5
* SQLite 3.28.0
* bundler

## Installation
```
git clone https://github.com/sheep-goat/DuelistSearch.git
cd DuelistSearch
bundle install --path vendor/bundle
```
## Configuration

## Database creation
```
bundle exec rails db:create
```

## Database initialization
```
bundle exec rails db:migrate
```

## How to run the test suite
```
bundle exec rails db:migrate
bundle exec rspec spec
```

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions
