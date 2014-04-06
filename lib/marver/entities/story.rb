require './lib/marver.rb'

module Marver
  class Story
    attr_reader :id, :json, :title, :type, :resource_uri, :description, :thumbnail,
                :comics, :series, :events, :characters, :creators, :original_issue

    class << self
      def build(response)
        if response.kind_of?(Array)
          response.collect do |story|
            Marver::Story.new(story)
          end
        else
          new(response.results)
        end
      end
    end

    def initialize(json)
      @json = json

      @title = @json['title']
      @type = @json['type']
      @resource_uri = @json['resourceURI']
      @description = @json['description']

      @original_issue = Marver::Summary::Comic.new(@json['originalIssue'])

      CoreEntitiesBuilder.build!(self)
      CommonEntitiesBuilder.build!(self)
    end
  end
end
