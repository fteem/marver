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

    end
  end
end
