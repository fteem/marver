require './lib/marver.rb'
require 'digest/md5'

module Marver
  module API
    class Client
      API_VERSION = "v1"
      API_ENDPOINT = "http://gateway.marvel.com"

      def get(entity, options)
        url = "#{endpoint}/#{entity.to_s}"
        json = RestClient.get url, { params: options.merge(credentials) }
        Marver::API::Response.new(json)
      end

      def get_uri(uri)
        response = RestClient.get uri, { params: credentials }
        Marver::API::Response.new(response)
      end

      def endpoint
        "#{API_ENDPOINT}/#{API_VERSION}/public"
      end

      def credentials
        Credentials.get
      end

    end
  end
end
