require 'rest_client'
require 'digest/md5'

module Marver
  module API
    class Client
      API_VERSION = "v1"
      API_ENDPOINT = "http://gateway.marvel.com"

      class << self
        def get(query_string)
          new.get_request(query_string)
        end
      end

      def get_request(query_string)
        url = endpoint + query_string + credentials
        Marver::API::Response.new(RestClient.get(url))
      end

      def endpoint
        "#{API_ENDPOINT}/#{API_VERSION}/public/"
      end

      def credentials
        Credentials.get
      end

    end
  end
end
