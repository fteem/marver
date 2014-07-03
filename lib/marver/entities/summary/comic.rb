require './lib/marver'

module Marver
  module Summary
    class Comic
      attr_reader :id, :name, :resource_uri, :type

      def initialize(json)
        @name = json['name']
        @resource_uri = json['resourceURI']
        @id = json['id'].to_i
      end

      def full
        response = Marver::API::Client.new.get_uri(@resource_uri)
        results = Marver::DataContainer.new(response).results
        Marver::Factory::Comic.new(results).build
      end
    end
  end
end
