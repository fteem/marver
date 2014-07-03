require './lib/marver.rb'
module Marver
  module Summary
    class Serie
      attr_reader :id, :name, :resource_uri, :type

      def initialize(json)
        @name = json['name']
        @resource_uri = json['resourceURI']
      end

      def full
        response = Marver::API::Response.new(RestClient.get(@resource_uri))
        results = Marver::DataContainer.new(response).results
        Marver::Factory::Serie.new(results).build
      end
    end
  end
end
