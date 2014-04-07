module Marver
  module Summarizable

    def characters
      @characters ||= entity_items('characters').collect do |character|
        Marver::Summary::Character.new(character)
      end
    end

    def creators
      @creators ||= entity_items('creators').collect do |creator|
        Marver::Summary::Creator.new(creator)
      end
    end

    def events
      @events ||= entity_items('events').collect do |event|
        Marver::Summary::Event.new(event)
      end
    end

    def series
      @series ||= entity_items('series').collect do |serie|
        Marver::Summary::Serie.new(serie)
      end
    end

    def stories
      @stories ||= entity_items('stories').collect do |story|
        Marver::Summary::Story.new(story)
      end
    end

    def characters
      @characters ||= entity_items('characters').collect do |character|
        Marver::Summary::Character.new(character)
      end
    end

    def comics
      @comics ||= entity_items('comics').collect do |comic|
        Marver::Summary::Comic.new(comic)
      end
    end

    def entity_items(entity)
      if json[entity].kind_of?(Hash) && json[entity].has_key?('items')
        [json[entity]['items']].compact.flatten(1)
      else
        [json[entity]].compact.flatten(1)
      end
    end
  end
end
