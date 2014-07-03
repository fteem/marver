require './lib/marver.rb'

module Marver
  class Story
    attr_reader :title, :type, :resource_uri, :description, :thumbnail, :original_issue,
      :characters, :creators, :events, :series, :comics 

    def initialize(args)
      @characters = args[:characters] 
      @creators = args[:creators]
      @events = args[:events]
      @series = args[:series]
      @comics = args[:comics]
      @original_issue = args[:original_issue]

      args[:attributes].each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
