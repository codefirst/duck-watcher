#! /user/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require 'net/https'

class ASPublisher
  def initialize
    @entry_point = ENV['ASAKUSA_SATELLITE_ENTRY_POINT']
    @api_key     = ENV['ASAKUSA_SATELLITE_API_KEY']
    @room_id     = ENV['ASAKUSA_SATELLITE_ROOM_ID']
  end

  def publish(message)
    uri = URI(@entry_point)

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    https.start do |conn|
      conn.post(uri.path + "/message",
               "room_id=#{@room_id}&message=#{message}&api_key=#{@api_key}")
    end
  end
end


if __FILE__ == $0
  ASPublisher.new.publish('メンゴメンゴ')
end
