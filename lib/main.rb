#! /user/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require 'tweetstream'
require 'json'

$: << "."

require File.dirname(__FILE__) + '/as_publisher'

KEYWORDS = ENV['KEYWORDS']

publisher = ASPublisher.new

TweetStream.configure do |config|
  config.consumer_key       = ENV["CONSUMER_KEY"]
  config.consumer_secret    = ENV["CONSUMER_SECRET"]
  config.oauth_token        = ENV["ACCESS_TOKEN_KEY"]
  config.oauth_token_secret = ENV["ACCESS_SECRET"]
  config.auth_method        = :oauth
end

TweetStream::Client.new.track(KEYWORDS.split(",")) do |status|
  url = "https://twitter.com/#{status.user.screen_name}/status/#{status.id}"
  publisher.publish(url)
end

