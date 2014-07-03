require './lib/marver/api/client'
require './lib/marver/data_container'
require './lib/marver/entities/story'

module Marver
  class StoryFinder
    ALLOWED_PARAMS = [:modifiedSince, :comics, :series, :events, :creators, :characters]

    ALLOWED_PARAMS.each do |param|
      parameterized_param = StringHelper.parameterize(param.to_s)
      define_method("find_by_#{parameterized_param}") do |value|
        find({ "#{param}".to_sym => value })
      end
    end
    
    private
    def find(conditions = {})
      FinderParamFilter.filter!(conditions, ALLOWED_PARAMS)
      response = Marver::API::Client.new.get(:stories, conditions)
      results = Marver::DataContainer.new(response).results
      Marver::Factory::Story.new(results).build
    end
  end
end