require './lib/marver/api/client'
require './lib/marver/data_container'
require './lib/marver/entities/event'

module Marver
  class EventFinder
    ALLOWED_PARAMS = [:name, :nameStartsWith, :modifiedSince, :creators, :characters,
                        :series, :comics, :stories, :orderBy, :limit, :offset]

    ALLOWED_PARAMS.each do |param|
      parameterized_param = StringHelper.parameterize(param.to_s)
      define_method("find_by_#{parameterized_param}") do |value|
        find({ "#{param}".to_sym => value })
      end
    end

    private
    def find(options = {})
      FinderParamFilter.filter!(options, ALLOWED_PARAMS)
      response = Marver::API::Client.new.get(:events, options)
      results = Marver::DataContainer.new(response).results
      Marver::Factory::Event.new(results).build
    end
  end
end
