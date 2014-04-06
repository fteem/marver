module Marver
  module Summary
    class Creator
      attr_reader :name, :resource_uri, :role

      def initialize(json)
        @name = json['name']
        @resource_uri = json['resourceURI']
        @role = json['role']
      end
    end
  end
end
