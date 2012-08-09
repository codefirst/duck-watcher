#! /user/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require 'twitter/json_stream'
require 'json'
require File.dirname(__FILE__) + '/as_publisher'

KEYWORDS = ENV['KEYWORDS']
LOGIN    = ENV['TWITTER_LOGIN_ID']
PASSWORD = ENV['TWITTER_PASSWORD']

publisher = ASPublisher.new

EventMachine::run {

  stream = Twitter::JSONStream.connect(
    :path    => "/1/statuses/filter.json?track=#{KEYWORDS}",
    :auth    => "#{LOGIN}:#{PASSWORD}",
    :ssl     => true
  )

  stream.each_item do |item|
    $stdout.print item
    $stdout.flush

    json = JSON.parse(item)
    url = "https://twitter.com/#{json["user"]["screen_name"]}/status/#{json["id"]}"

    publisher.publish(url)
  end

  stream.on_error do |message|
    $stdout.print message
    $stdout.flush
  end

  stream.on_max_reconnects do |timeout, retries|
    # Something is wrong on your side. Send yourself an email.
  end

  stream.on_no_data do
    # Twitter has stopped sending any data on the currently active
    # connection, reconnecting is probably in order
  end
}

