module Marver
  module Summary
    class Event
      attr_reader :id, :name, :resource_uri, :type

      def initialize(json)
        @id = json['id'].to_i
        @name = json['name']
        @resource_uri = json['resourceURI']
        @type = json['type'] || nil
      end

      def full
        response = Marver::API::Response.new(RestClient.get(@resource_uri))
        data = Marver::DataContainer.new(response).results
        Marver::Event.build(data)
      end
    end
  end
end
