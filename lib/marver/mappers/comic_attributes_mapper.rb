module Marver
  class ComicAttributesMapper

    include Marver::Mappable

  	def initialize(results)
  		@results = results
  	end

  	def map
  	  { 
        title:        @results['title'],
        resource_uri: @results['resourceURI'],
        id:           @results['id'].to_i,
        digital_id:   @results['digitalId'],
        issue_number: @results['issueNumber'],
        variant_description: @results['variantDescription'],
        description: @results['description'],
        isbn: @results['isbn'],
        upc: @results['upc'],
        diamond_code: @results['diamondCode'],
        ean: @results['ean'],
        issn: @results['issn'],
        format: @results['format'],
        page_count: @results['pageCount'],
    	  characters: characters, 
    	  stories: stories,
    	  creators: creators,
    	  events: events,
    	  series: series,
    	  urls: urls,
    	  prices: prices,
    	  images: images,
    	  thumbnail: thumbnail,
    	  text_objects: text_objects,
    	  dates: dates 
      }
  	end
  end
end