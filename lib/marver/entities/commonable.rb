module Marver
  module Commonable
    def prices
      @prices ||= entity_items('prices').collect do |price|
        Marver::Price.new(price)
      end
    end

    def images
      @images ||= entity_items('images').collect do |image|
        Marver::Image.new(image)
      end
    end

    def urls
      @urls ||= entity_items('urls').collect do |url|
        Marver::Url.new(url)
      end
    end

    def text_objects
      @text_objects ||= entity_items('textObjects').collect do |text_object|
        Marver::TextObject.new(text_object)
      end
    end

    def thumbnail
      @thumbnail ||= Marver::Image.new(json['thumbnail'])
    end

    def dates
      @dates ||= entity_items('dates').collect do |date|
        Marver::KeyDate.new(date)
      end
    end
  end
end
