#!/usr/bin/env ruby

require 'dotenv'
require 'oauth'
require 'oauth/consumer'

Dotenv.load

def main
  @consumer = OAuth::Consumer.new(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], {
    :site => "https://api.twitter.com"
  })

  @request_token = @consumer.get_request_token
  puts "Access to #{@request_token.authorize_url}"
  print "Input PIN:"
  pin = gets
  @access_token = @request_token.get_access_token(:oauth_verifier => pin.strip)
  puts "Write below to .env files"
  puts "ACCESS_TOKEN_KEY=#{@access_token.token}"
  puts "ACCESS_SECRET=#{@access_token.secret}"
end

if __FILE__ == $0
  main
end
