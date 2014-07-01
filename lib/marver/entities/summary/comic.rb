require './lib/marver.rb'

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
        response = Marver::API::Response.new(RestClient.get(@resource_uri))
        data = Marver::DataContainer.new(response)
        Marver::Comic.build(data.results)
      end
    end
  end
end
