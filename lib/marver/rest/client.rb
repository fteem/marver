require 'rest_client'
require 'digest/md5'
require_relative 'response'

module Marver
  module REST
    class Client
      API_VERSION = "v1"
      API_ENDPOINT = "http://gateway.marvel.com"

      class << self
        def get(query_string)
          new.get_request(query_string)
        end
      end

      def get_request(query_string)
        url = endpoint + query_string
        Marver::REST::Response.new(RestClient.get(url))
      end

      def endpoint
        "#{API_ENDPOINT}/#{API_VERSION}/public/"
      end

    end
  end
end
