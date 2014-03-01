require './lib/marver.rb'

module Marver
  class Character

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |character|
            Marver::Character.new(character, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    attr_reader :id, :resource_uri, :description, :urls, :name,
      :thumbnail, :comics, :stories, :events, :series



    def initialize(response, credentials)
      @credentials = credentials

      @description = response['description']
      @id = response['id'].to_i
      @credentials = credentials
      @name = response['name']
      @resource_uri = "#{response['resourceURI']}?#{@credentials.to_s}"

      @urls = build_urls_list(response)
      @thumbnail = build_thumbnail_url(response)

      @comics = build_comics_list(response)
      @stories = build_stories_list(response)
      @events = build_events_list(response)
      @series = build_series_list(response)
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
