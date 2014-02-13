module Marver
  class Character
    attr_reader :id, :name, :description, :resource_uri, :urls,
      :thumbnail, :comics, :stories, :events, :series

    def initialize(json)
      @id = json['id']
      @name = json['name']
      @description = json['description']
      @resource_uri = json['resourceURI']
      @urls = build_urls_list(json)
      @thumbnail = build_thumbnail_url(json)
      @comics = build_comics_list(json)
      @stories = build_stories_list(json)
      @events = build_events_list(json)
      @series = build_series_list(json)
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
        Marver::Comic.new(comic)
      end
    end

    def build_stories_list(json)
      return nil unless json['stories']
      json['stories']['items'].collect do |story|
        Marver::Story.new(story)
      end
    end

    def build_events_list(json)
      return nil unless json['events']
      json['events']['items'].collect do |event|
        Marver::Event.new(event)
      end
    end

    def build_series_list(json)
      return nil unless json['series']
      json['series']['items'].collect do |serie|
        Marver::Serie.new(serie)
      end
    end
  end
end
