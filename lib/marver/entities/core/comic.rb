require './lib/marver.rb'

module Marver
  class Comic

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |comic|
            new(comic, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    attr_reader :id, :digital_id, :title, :issue_number,
                :variant_description, :description, :isbn,
                :upc, :diamond_code, :ean, :issn, :format,
                :page_count, :resource_uri

    def initialize(json, credentials)
      @json = json
      @credentials = credentials
      @title = json['title']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
      @id = json['id'].to_i
      @digital_id = json['digitalId']
      @issue_number = json['issueNumber']
      @variant_description = json['variantDescription']
      @description = json['description']
      @isbn = json['isbn']
      @upc = json['upc']
      @diamond_code = json['diamondCode']
      @ean = json['ean']
      @issn = json['issn']
      @format = json['format']
      @page_count = json['pageCount']
    end

    def thumbnail
      @json['thumbnail']['path'] + "." + @json['thumbnail']['extension']
    end

    def dates
      @dates ||= @json['dates'].collect do |date|
        Marver::KeyDate.new(date)
      end
    end

    def text_objects
      @text_objects ||= @json['textObjects'].collect do |to|
        Marver::TextObject.new(to)
      end
    end

    def urls
      @urls ||= @json['urls'].collect do |url|
        Marver::Url.new(url)
      end
    end

    def series
      @series ||= [@json['series']].compact.flatten(1).collect do |serie|
        Marver::SerieSummary.new(serie, @credentials)
      end
    end

    def images
      @images ||= [@json['images']].compact.flatten(1).collect do |image|
        Marver::Image.new(image)
      end
    end

    def prices
      @prices ||= [@json['prices']].compact.flatten(1).collect do |price|
        Marver::Price.new(price)
      end
    end

    def characters
      @characters ||= [@json['characters']['items']].compact.flatten(1).collect do |character|
        Marver::CharacterSummary.new(character, @credentials)
      end
    end

    def creators
      @creators ||= [@json['creators']['items']].compact.flatten(1).collect do |creator|
        Marver::CreatorSummary.new(creator, @credentials)
      end
    end

    def stories
      @stories ||= [@json['stories']['items']].compact.flatten(1).collect do |story|
        Marver::StorySummary.new(story, @credentials)
      end
    end

    def events
      @events ||= [@json['events']['items']].compact.flatten(1).collect do |event|
        Marver::EventSummary.new(event, @credentials)
      end
    end
  end
end
