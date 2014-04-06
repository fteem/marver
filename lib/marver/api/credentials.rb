require 'digest/md5'
require 'marver/configuration'

module Marver
  module API
    class Credentials

      class << self
        def get
          public_key  = Marver.configuration.public_key
          private_key = Marver.configuration.private_key
          timestamp = Time.now.to_i.to_s
          hash = Digest::MD5.hexdigest(timestamp + private_key + public_key)

          "?ts=#{timestamp}&apikey=#{public_key}&hash=#{hash}"
        end
      end

    end
  end
end
