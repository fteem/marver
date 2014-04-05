module Marver
  module Summary
    class Serie
      attr_reader :id, :name, :resource_uri, :type

      def initialize(json, credentials)
        @credentials = credentials

        @name = json['name']
        @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
      end

    end
  end
end
