module Marver
  class EventAttributesMapper

    include Marver::Mappable
    
    def initialize(results)
      @results = results
    end

    def map
      { title:        @results['title'],
        resource_uri: @results['resourceURI'],
        description:  @results['description'],
        id:           @results['id'].to_i,
        next:         next_event,
        previous:     previous_event,
        creators:     creators,
        characters:   characters,
        series:       series,
        stories:      stories,
        comics:       comics,
        urls:         urls,
        thumbnail:    thumbnail,
        start:        start_date,
        end:          end_date
      }
    end
  end
end