Dir["./lib/marver/entities/*.rb"].each {|file| require file }

module Marver
  class Character < Entity
    attr_reader :id, :description, :resource_uri, :urls,
      :thumbnail, :comics, :stories, :events, :series

    def initialize(json)
      @id = json['id']
      @description = json['description']
      @urls = build_urls_list(json)
      @thumbnail = build_thumbnail_url(json)
      @comics = build_comics_list(json)
      @stories = build_stories_list(json)
      @events = build_events_list(json)
      @series = build_series_list(json)
      super(json)
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
      return nil unless json['comics']
      json['comics']['items'].collect do |comic|
        Marver::Entity.new(comic)
      end
    end

    def build_stories_list(json)
      return nil unless json['stories']
      json['stories']['items'].collect do |story|
        Marver::Entity.new(story)
      end
    end

    def build_events_list(json)
      return nil unless json['events']
      json['events']['items'].collect do |event|
        Marver::Entity.new(event)
      end
    end

    def build_series_list(json)
      return nil unless json['series']
      json['series']['items'].collect do |serie|
        Marver::Entity.new(serie)
      end
    end
  end
end
