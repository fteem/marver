require './lib/marver/api/client'
require './lib/marver/data_container'
require './lib/marver/entities/creator'

module Marver
  class CreatorFinder
    ALLOWED_PARAMS = [:firstName, :middleName, :lastName, :suffix, :nameStartsWith,
      :firstNameStartsWith, :middleNameStartsWith, :lastNameStartsWith, :modifiedSince, 
      :comics, :series, :events, :stories]

    ALLOWED_PARAMS.each do |param|
      parameterized_param = StringHelper.parameterize(param.to_s)
      define_method("find_by_#{parameterized_param}") do |value|
        find({ "#{param}".to_sym => value })
      end
    end

    private
    def find(conditions = {})
      FinderParamFilter.filter!(conditions, ALLOWED_PARAMS)
      response = Marver::API::Client.new.get(:creators, conditions)
      results = Marver::DataContainer.new(response).results
      Marver::Factory::Creator.new(results).build
    end
  end
end