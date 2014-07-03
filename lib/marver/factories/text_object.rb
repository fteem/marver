module Marver
  module Factory
    class TextObject
      def initialize text_objects
        @text_objects = text_objects
      end

      def build
        @text_objects.collect do |text_object|
          Marver::TextObject.new(text_object)
        end
      end

    end
  end
end