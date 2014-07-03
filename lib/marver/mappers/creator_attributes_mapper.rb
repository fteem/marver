module Marver
  class CreatorAttributesMapper
    
    include Marver::Mappable

    def initialize(results)
      @results = results
    end

    def map
      {
        id: @results["id"],
        first_name: @results["firstName"],
        last_name: @results["lastName"],
        middle_name: @results["middleName"],
        suffix: @results['suffix'],
        full_name: @results['fullName'],
        description: @results["description"],
        resource_uri: @results["resourceURI"],
        series: series,
        stories: stories,
        comics: comics,
        events: events,
        urls: urls,
        thumbnail: thumbnail
      }
    end
  end
end