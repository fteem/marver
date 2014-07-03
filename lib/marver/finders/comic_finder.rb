require './lib/marver.rb'

module Marver
  class ComicFinder
    ALLOWED_PARAMS = [:format, :formatType, :noVariants, :dateDescriptor, 
      :dateRange, :title, :titleStartsWith, :startYear, :issueNumber, :diamondCode,
      :digitalId, :upc, :isbn, :ean, :issn, :hasDigitalIssue, :modifiedSince, 
      :creators, :characters, :series, :events, :stories, :sharedAppereances,
      :collaborators]

    ALLOWED_PARAMS.each do |param|
      parameterized_param = StringHelper.parameterize(param.to_s)
      define_method("find_by_#{parameterized_param}") do |value|
        find({ "#{param}".to_sym => value })
      end
    end

    private

    def find(options = {})
      FinderParamFilter.filter!(options, ALLOWED_PARAMS)
      response = Marver::API::Client.new.get(:comics, options)
      results = Marver::DataContainer.new(response).results
      Marver::Factory::Comic.new(results).build
    end
  end
end
