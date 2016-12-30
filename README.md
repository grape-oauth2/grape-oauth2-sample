# Grape & Grape::OAuth2 sample application
[![Build Status](https://travis-ci.org/grape-oauth2/grape-oauth2-sample.svg?branch=master)](https://travis-ci.org/grape-oauth2/grape-oauth2-sample)
[![Code Climate](https://codeclimate.com/github/grape-oauth2/grape-oauth2-sample/badges/gpa.svg)](https://codeclimate.com/github/grape-oauth2/grape-oauth2-sample)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](#license)

This is an example of using [Grape::OAuth2 gem](https://github.com/nbulaj/grape_oauth2) with the [Grape API](https://github.com/ruby-grape/grape) project.

This app is ready to deploy to Heroku [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/grape-oauth2/grape-oauth2-sample).

Project stack includes: **Grape, Grape::OAuth2, Grape::Entity, ActiveRecord 5, Puma, PostgreSQL, Dotenv, Rack::Cors, Rubocop, RSpec**.

Supported Ruby: 2.2 — 2.4

## Implemented features

* API endpoints with different types of requests (GET, POST);
* API versioning
* Resource Owner password credentials authentication;
* Protected endpoints access with OAuth Tokens;
* Generate new Access Token via Refresh Token.

## Run

To run the application do the following from your command-line:

`bundle exec rackup config.ru`

Available API:

```
  GET  |  /api(.json)                     |      |  Root action   
 POST  |  /api/oauth/authorize(.json)     |      |  OAuth 2.0 Authorization Endpoint                       
 POST  |  /api/oauth/token(.json)         |      |  OAuth 2.0 Token Endpoint                               
 POST  |  /api/oauth/revoke(.json)        |      |  OAuth 2.0 Token Revocation      
  GET  |  /api/:version/me(.json)         |  v1  |  Information about current resource owner
  GET  |  /api/:version/posts(.json)      |  v1  |  Get all the posts without authorization                
  GET  |  /api/:version/posts/:id(.json)  |  v1  |  Read post by ID only if it belongs to authorized author
 POST  |  /api/:version/posts(.json)      |  v1  |  Create post from authorized user                       
```

## Routes

To print all the API routes you can run a special Rake task:

`bundle exec rake grape:routes`
