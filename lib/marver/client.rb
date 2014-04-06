require './lib/marver.rb'

module Marver
  class Client
    attr_reader :characters

    def initialize(private_key, public_key)
      @characters = Marver::CharacterFinder.new(@credentials)
    end

  end
end
