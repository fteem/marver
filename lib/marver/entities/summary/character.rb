require './lib/marver.rb'

module Marver
  module Summary
    class Character
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
        Marver::Character.build(data)
      end

    end
  end
end
