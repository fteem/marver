require './lib/marver.rb'

module Marver
  class Story
    attr_reader :id, :json, :title, :type, :resource_uri, :description, :thumbnail,
                :comics, :series, :events, :characters, :creators, :original_issue,
                :credentials

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |story|
            Marver::Story.new(story, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    def initialize(json, credentials)
      @credentials = credentials
      @json = json

      @title = @json['title']
      @type = @json['type']
      @resource_uri = "#{@json['resourceURI']}?#{@credentials.to_s}"
      @description = @json['description']

      @original_issue = Marver::Summary::Comic.new(@json['originalIssue'], @credentials)

      CoreEntitiesBuilder.build!(self)
      CommonEntitiesBuilder.build!(self)
    end
  end
end
