require './lib/marver.rb'

module Marver
  class ComicFinder
    def find(options = {})
      response = Marver::API::Client.new.get(:comics, options)
      results = Marver::DataContainer.new(response).results
      Marver::Comic.build(results)
    end
  end
end
