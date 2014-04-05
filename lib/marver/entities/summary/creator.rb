module Marver
  module Summary
    class Creator
      attr_reader :name, :resource_uri, :role

      def initialize(json, credentials)
        @credentials = credentials
        @name = json['name']
        @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
        @role = json['role']
      end
    end
  end
end
