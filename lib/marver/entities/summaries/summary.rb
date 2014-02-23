module Marver
  class Summary
    attr_reader :name, :resource_uri, :type

    def initialize(json, credentials)
      @credentials = credentials
      @name = json['name']
      @resource_uri = json['resourceURI'] + "?#{@credentials.to_s}"
      @type = json['type'] || nil
    end
  end
end
