require 'rest_client'
require 'digest/md5'
require_relative 'response'

module Marver
  module REST
    class Client
      API_VERSION = "v1"
      API_ENDPOINT = "http://gateway.marvel.com"

      attr_reader :private_key, :public_key

      def initialize(private_key, public_key)
        @public_key = public_key
        @private_key = private_key
      end

      def call(noun)
        url = build_url(noun)
        Marver::REST::Response.new(RestClient.get(url))
      end

      private

      def build_url(noun)
        ts = Time.now.to_i.to_s
        "#{API_ENDPOINT}/#{API_VERSION}/public/#{noun}?ts=#{ts}&apikey=#{public_key}&hash=#{md5_hash(ts)}"
      end

      def md5_hash(ts)
        Digest::MD5.hexdigest(ts + private_key + public_key)
      end

    end
  end
end
