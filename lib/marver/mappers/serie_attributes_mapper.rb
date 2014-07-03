module Marver
  class SerieAttributesMapper

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
        start_year:   @results['startYear'],
        end_year:     @results['endYear'],
        rating:       @results['rating'],
        comics: comics, 
        stories: stories,
        events: events,
        creators: creators,
        characters: characters,
        next: next_serie.first,
        previous: prev_serie.first,
        urls:       urls,
        thumbnail: thumbnail
      }
    end
  end
end