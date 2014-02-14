module Marver
  class Entity
    attr_reader :name, :resource_uri, :type

    def initialize(json)
      @name = json['name']
      @resource_uri = json['resourceURI']
      @type = json['type'] || nil
    end
  end
end
