# README

Things you may want to cover:

* Ruby version
3.2.2

* Rails version
7.1.2

* System dependencies

* Configuration

* Database creation
rails db:setup

* Database initialization

* How to run the test suite
Run `rspec` at the root of your application

* ...

# Overview

This repo is a rails monolith for Nayya's main application.

This page has instructions to get started on a local dev machine.

# Dependencies

Install prerequisite dependencies before setting up the repo

* ## OS Package Manager

  **macOS**

  [Install homebrew](https://docs.brew.sh/Installation) and then run
    ```bash
    brew update
    brew install gpg libpq imagemagick gnupg
    ```

  **Debian**

    ```bash
    sudo apt-get install imagemagick
    ```

* ## Ruby

  # install ruby
    rvm install 3.2.2
    rvm use 3.2.2
    ```

  See [installing rvm](https://rvm.io/rvm/install) for more details

# Setup

gem install rails -v 7.1.2
gem uninstall bundler 
gem install bundler -v 2.4.18

# install ruby dependencies
bundler install

# database
rails db:create
rails db:migrate
rails db:seed

# Run

```bash
# start rails server
rails s

# Test
```bash
# setup test database
RAILS_ENV=test rails db:drop
RAILS_ENV=test rails db:create
RAILS_ENV=test rails db:migrate

# run all tests
bundle exec rspec

