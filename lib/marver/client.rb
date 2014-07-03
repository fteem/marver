require './lib/marver.rb'

module Marver
  class Client
    attr_reader :characters, :series, :comics, :stories, :creators, :events

    def initialize
      @characters = Marver::CharacterFinder.new
      @series = Marver::SerieFinder.new
      @comics = Marver::ComicFinder.new
      @stories = Marver::StoryFinder.new
      @creators = Marver::CreatorFinder.new
      @events = Marver::EventFinder.new
    end

  end
end
