module Marver
  class Event
    attr_reader :title, :resource_uri, :description, :start, :end, :next, :previous,
      :series, :stories, :events, :comics, :characters, :creators, :urls, :thumbnail

    def initialize(args)
      @next = args[:next]
      @previous = args[:previous]
      @creators = args[:creators]
      @characters = args[:characters]
      @series = args[:series]
      @stories = args[:stories]
      @events = args[:events]
      @comics = args[:comics]
      @urls   = args[:urls]
      @thumbnail = args[:thumbnail]
      @start = args[:start]
      @end = args[:_end]

      args[:attributes].each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
