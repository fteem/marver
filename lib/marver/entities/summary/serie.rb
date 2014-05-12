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
        data = Marver::DataContainer.new(response).results
        Marver::Serie.build(data)
      end

    end
  end
end
