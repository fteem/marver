require './lib/marver/api/client'
require './lib/marver/data_container'
require './lib/marver/entities/serie'

module Marver
  class SerieFinder
    ALLOWED_PARAMS = [:name, :modifiedSince, :creators, :characters, :series, 
                      :comics, :stories, :orderBy, :limit, :offset]

    ALLOWED_PARAMS.each do |param|
      parameterized_param = StringHelper.parameterize(param.to_s)
      define_method("find_by_#{parameterized_param}") do |value|
        find({ "#{param}".to_sym => value })
      end
    end

    private
    def find(conditions = {})
      FinderParamFilter.filter!(conditions, ALLOWED_PARAMS)
      response = Marver::API::Client.new.get(:series, conditions)
      results = Marver::DataContainer.new(response).results
      Marver::Factory::Serie.new(results).build
    end
  end
end