module Marver
  class Story
    attr_reader :name, :type, :resource_uri

    def initialize(json)
      @name = json['name']
      @type = json['type']
      @resource_uri = json['resourceURI']
    end
  end
end
