module Marver
  class StoryAttributesMapper

    include Marver::Mappable

    def initialize(results)
      @results = results
    end

    def map
      { 
        title:        @results['title'],
        resource_uri: @results['resourceURI'],
        description:  @results['description'],
        id:           @results['id'].to_i,
        type:         @results['type'],
        characters: characters, 
        creators: creators,
        events: events,
        series: series,
        comics: comics,
        original_issue: original_issue
      }
    end
  end
end