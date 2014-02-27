require './lib/marver.rb'

module Marver
  class ComicSummary
    attr_reader :id, :name, :resource_uri, :type

    def initialize(json, credentials)
      @credentials = credentials
      @name = json['name']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
      @id = json['id'].to_i
    end
  end
end
