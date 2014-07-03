require './lib/marver'

module Marver
  module Summary
    class Creator
      attr_reader :name, :resource_uri, :role

      def initialize(json)
        @name = json['name']
        @resource_uri = json['resourceURI']
        @role = json['role']
      end

      def full
        response = Marver::API::Response.new(RestClient.get(@resource_uri))
        results = Marver::DataContainer.new(response).results
        Marver::Factory::Creator.new(results).build
      end
    end
  end
end
