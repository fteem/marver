require './lib/marver.rb'

module Marver
  class Client
    attr_reader :characters, :series, :comics, :stories

    def initialize
      @characters = Marver::CharacterFinder.new
      @series = Marver::SerieFinder.new
      @comics = Marver::ComicFinder.new
      @stories = Marver::StoryFinder.new
    end

  end
end
