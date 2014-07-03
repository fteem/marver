module Marver
  module Summary
    class Story
      attr_reader :id, :name, :resource_uri, :type

      def initialize(json)
        @name = json['name']
        @resource_uri = json['resourceURI']
        @type = json['type'] || nil
        @id = json['id'].to_i
      end

      def full
        response = Marver::API::Response.new(RestClient.get(@resource_uri))
        results = Marver::DataContainer.new(response).results
        Marver::Factory::Story.new(results).build
      end
    end
  end
end
