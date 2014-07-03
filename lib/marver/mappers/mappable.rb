require './lib/marver.rb'

module Marver
  module Mappable
    private
    def next_event
      Marver::Factory::Summary::Event.new(@results['next']).build.first
    end

    def previous_event
      Marver::Factory::Summary::Event.new(@results['previous']).build.first
    end

    def creators
      Marver::Factory::Summary::Creator.new(@results['creators']['items']).build
    end

    def characters
      Marver::Factory::Summary::Character.new(@results['characters']['items']).build
    end

    def series
      Marver::Factory::Summary::Serie.new(@results['series']['items'] || @results['series']).build
    end

    def stories
      Marver::Factory::Summary::Story.new(@results['stories']['items']).build
    end

    def comics
      Marver::Factory::Summary::Comic.new(@results['comics']['items']).build
    end

    def urls
      Marver::Factory::Url.new(@results['urls']).build
    end

    def thumbnail
      Marver::Image.new(@results['thumbnail']) if @results['thumbnail']
    end

    def start_date
      DateTime.parse(@results['start'])
    end

    def end_date
      DateTime.parse(@results['end'])
    end

    def urls
      Marver::Factory::Url.new(@results['urls']).build
    end

    def events
      Marver::Factory::Summary::Event.new(@results['events']['items']).build
    end

    def text_objects
      Marver::Factory::TextObject.new(@results['textObjects']).build
    end
    
    def dates
      Marver::Factory::Date.new(@results['dates']).build
    end

    def prices
      Marver::Factory::Price.new(@results['prices']).build
    end

    def next_serie
      Marver::Factory::Summary::Serie.new(@results['next']).build
    end

    def prev_serie
      Marver::Factory::Summary::Serie.new(@results['previous']).build
    end

    def original_issue
      Marver::Factory::Summary::Comic.new(@results['originalIssue']).build.first
    end

    def images
      Marver::Factory::Image.new(@results['images']).build
    end
  end
end