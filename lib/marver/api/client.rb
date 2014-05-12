require './lib/marver.rb'
require 'digest/md5'

module Marver
  module API
    class Client
      include Marver::Queryable

      API_VERSION = "v1"
      API_ENDPOINT = "http://gateway.marvel.com"

      def get(entity, options)
        query_string = options.empty? ? "" : hash_to_querystring(options)
        url = endpoint + "#{entity.to_s}?" + query_string + credentials
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
