module Marver
  class Serie
    attr_reader :id, :title, :resource_uri, :description, :start_year, :end_year, :comics,
                :rating, :previous, :stories, :events, :creators, :characters, :next,
                :urls, :thumbnail

    def initialize(args)
      @stories = args[:stories]
      @events = args[:events]
      @creators = args[:creators]
      @characters = args[:characters]
      @next = args[:next_serie]
      @previous = args[:prev_serie]
      @comics = args[:comics]
      @urls = args[:urls]
      @thumbnail = args[:thumbnail]

      args[:attributes].each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
