module Marver
  class Serie
    attr_reader :name, :resource_uri

    def initialize(json)
      @name = json['name']
      @resource_uri = json['resourceURI']
    end
  end
end
