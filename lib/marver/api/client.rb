require 'rest_client'
require 'digest/md5'

module Marver
  module API
    class Client
      include Marver::Queryable

      API_VERSION = "v1"
      API_ENDPOINT = "http://gateway.marvel.com"

      class << self
        def get(entity, options)
          qs = options.empty? ? "" : hash_to_query_string(options)
          new.get_request(entity, qs)
        end
      end

      def get_request(entity, query_string)
        url = endpoint + "#{entity.to_s}" + query_string + credentials
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
