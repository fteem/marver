require './lib/marver.rb'

module Marver
  class Character
    attr_reader :id, :resource_uri, :description, :thumbnail, :urls, :name, 
                :series, :stories, :events, :comics, :full_path

    def initialize(args)
      @series   = args[:series]
      @stories  = args[:stories]
      @events   = args[:events]
      @comics   = args[:comics]
      @urls     = args[:urls]
      @thumbnail = args[:thumbnail]

      args[:attributes].each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
