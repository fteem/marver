module Marver
  class Character
    attr_accessor :name, :description, :thumbnail, :comics

    def initialize(json)
      @name = json['name'].strip
      @description = json['description']
      @thumbnail = build_thumbnail_url(json)
      @comics = build_comics_list(json['comics']['items'])
    end

    private

    def build_comics_list(json)
      json.inject([]) do |collection, data|
        collection << Comic.new(data)
      end
    end

    def build_thumbnail_url(json)
      json['thumbnail']['path'] + '.' + json['thumbnail']['extension']
    end
  end
end
