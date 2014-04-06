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

    end
  end
end
