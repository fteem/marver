require './lib/marver.rb'

module Marver
  class ComicSummary
    attr_reader :id, :title, :resource_uri, :type

    def initialize(json, credentials)
      @credentials = credentials
      @title = json['title']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
      @id = json['id'].to_i
    end
  end
end
