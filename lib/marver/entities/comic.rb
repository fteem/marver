module Marver
  class Comic
    attr_reader :id, :name, :resource_uri

    def initialize(json)
      @id   = json['id']
      @name = json['name']
      @resource_uri = json['resourceURI']
    end
  end
end
