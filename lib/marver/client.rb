require './lib/marver.rb'

module Marver
  class Client
    attr_reader :characters

    def initialize
      @characters = Marver::CharacterFinder.new
    end

  end
end
