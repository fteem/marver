require './lib/marver.rb'

module Marver
  class Story
    include Marver::Summarizable
    include Marver::Commonable

    attr_reader :json, :title, :type, :resource_uri, :description, :thumbnail, :original_issue

    class << self
      def build(results)
        if results.kind_of?(Array)
          results.collect do |story|
            Marver::Story.new(story)
          end
        else
          new(results)
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
    end
  end
end
