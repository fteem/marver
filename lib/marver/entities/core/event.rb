module Marver
  class Event
    attr_reader :name, :resource_uri

    def initialize(json, credentials)
      @credentials = credentials
      @json = json

      @name = json['name']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
    end
  end
end
