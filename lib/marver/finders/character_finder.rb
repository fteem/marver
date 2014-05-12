require './lib/marver.rb'

module Marver
  class CharacterFinder
    def find(options = {})
      response = Marver::API::Client.new.get(:characters, options)
      results = Marver::DataContainer.new(response).results
      Marver::Character.build(results)
    end
  end
end
