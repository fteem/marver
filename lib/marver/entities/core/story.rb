module Marver
  class Story
    attr_reader :title, :type, :resource_uri

    def initialize(data, credentials)
      @credentials = credentials
      @title = data['title']
      @type = data['type']
      @resource_uri = "#{data['resourceURI']}?#{@credentials.to_s}"
    end
  end
end
