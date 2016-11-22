# Grape & Grape::OAuth2 sample application
[![Build Status](https://travis-ci.org/grape-oauth2/grape-oauth2-sample.svg?branch=master)](https://travis-ci.org/grape-oauth2/grape-oauth2-sample)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](#license)

This is an example of using GrapeOAuth2 gem with the Grape API project.

This app is ready to deploy to Heroku [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/grape-oauth2/grape-oauth2-sample).

Project stack includes: **Grape, Grape-Entity, Grape-OAuth2, ActiveRecord 5, Puma, PostgreSQL, Dotenv, Rubocop, RSpec**.

## Implemented features

* API endpoints (GET, POST);
* Resource Owner password credentials authentication;
* Protected endpoints access with OAuth Tokens;
* Generate new Access Token via Refresh Token.

## Run

To run the application do the following from your command-line:

`> bundle exec rackup config.ru`

## Routes

To print all the API routes you can run a special Rake task:

`bundle exec rake grape:routes`
