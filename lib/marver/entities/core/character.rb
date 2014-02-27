require './lib/marver.rb'

module Marver
  class Character < CharacterSummary

    class << self
      def build(response, credentials)
        if response.results.length > 1
          response.results.collect do |result|
            new(result, credentials)
          end
        else
          new(response.results.first, credentials)
        end
      end
    end

    attr_reader :description, :urls,
      :thumbnail, :comics, :stories, :events, :series


    def initialize(results, credentials)
      @credentials = credentials

      @description = results['description']
      @urls = build_urls_list(results)
      @thumbnail = build_thumbnail_url(results)

      @comics = build_comics_list(results)
      @stories = build_stories_list(results)
      @events = build_events_list(results)
      @series = build_series_list(results)
      super(results, credentials)
    end

    private

    def build_urls_list(json)
      json['urls'].collect do |url|
        Marver::Url.new(url)
      end
    end

    def build_thumbnail_url(json)
      json['thumbnail']['path'] + '.' + json['thumbnail']['extension']
    end

    def build_comics_list(json)
      json['comics']['items'].collect do |comic|
        Marver::ComicSummary.new(comic, @credentials)
      end
    end

    def build_stories_list(json)
      json["stories"]["items"].collect do |story|
        Marver::StorySummary.new(story, @credentials)
      end
    end

    def build_events_list(json)
      json['events']['items'].collect do |event|
        Marver::EventSummary.new(event, @credentials)
      end
    end

    def build_series_list(json)
      json['series']['items'].collect do |serie|
        Marver::SerieSummary.new(serie, @credentials)
      end
    end
  end
end
