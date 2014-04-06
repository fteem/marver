module Marver
  module Summary
    class Serie
      attr_reader :id, :name, :resource_uri, :type

      def initialize(json)
        @name = json['name']
        @resource_uri = json['resourceURI']
      end

    end
  end
end
