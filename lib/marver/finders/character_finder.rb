require './lib/marver/api/client'
require './lib/marver/data_container'
require './lib/marver/entities/character'

module Marver
  class CharacterFinder
    ALLOWED_PARAMS = [:name, :nameStartsWith, :modifiedSince, :comics, :series, :events, :stories]

    ALLOWED_PARAMS.each do |param|
      parameterized_param = StringHelper.parameterize(param.to_s)
      define_method("find_by_#{parameterized_param}") do |value|
        find({ "#{param}".to_sym => value })
      end
    end

    private

    def find(options = {})
      FinderParamFilter.filter!(options, ALLOWED_PARAMS)
      response = Marver::API::Client.new.get(:characters, options)
      results = Marver::DataContainer.new(response).results
      Marver::Factory::Character.new(results).build
    end
  end
end
