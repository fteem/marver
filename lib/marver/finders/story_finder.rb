require './lib/marver.rb'

module Marver
  class StoryFinder
    def find(conditions = {})
      response = Marver::API::Client.new.get(:stories, conditions)
      results = Marver::DataContainer.new(response).results
      Marver::Story.build(results)
    end
  end
end