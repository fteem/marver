module Marver
  class CharacterAttributesMapper

    include Marver::Mappable

    def initialize(results)
      @results = results
    end

    def map
      {
        id: @results["id"],
        name: @results["name"],
        description: @results["description"],
        resource_uri: @results["resourceURI"],
        comics: comics, 
        stories: stories,
        series: series,
        events: events,
        urls:   urls,
        thumbnail: thumbnail
      }
    end
  end
end