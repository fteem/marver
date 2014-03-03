module Marver
  class Story
    attr_reader :title, :type, :resource_uri, :description, :thumbnail,
                :comics, :series, :events, :characters, :creators, :original_issue

    def initialize(data, credentials)
      @credentials = credentials
      @data = data

      @title = data['title']
      @type = data['type']
      @resource_uri = "#{data['resourceURI']}?#{@credentials.to_s}"
      @description = data['description']
      @thumbnail = build_thumbnail_url

      @comics = build_comics_list
      @series = build_series_list
      @events = build_events_list
      @characters = build_characters_list
      @creators = build_creators_list

      @original_issue = Marver::ComicSummary.new(@data['originalIssue'], @credentials)
    end

    private

    def build_thumbnail_url
      if @data['thumbnail']
        @data['thumbnail']['path'] + '.' + @data['thumbnail']['extension']
      end
    end

    def build_comics_list
      @data['comics']['items'].collect do |comic|
        Marver::ComicSummary.new(comic, @credentials)
      end
    end

    def build_series_list
      @data['series']['items'].collect do |serie|
        Marver::SerieSummary.new(serie, @credentials)
      end
    end

    def build_events_list
      @data['events']['items'].collect do |event|
        Marver::EventSummary.new(event, @credentials)
      end
    end

    def build_characters_list
      @data['characters']['items'].collect do |character|
        Marver::CharacterSummary.new(character, @credentials)
      end
    end

    def build_creators_list
      @data['creators']['items'].collect do |creator|
        Marver::CreatorSummary.new(creator, @credentials)
      end
    end

  end
end
