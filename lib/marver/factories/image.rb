module Marver
  module Factory
    class Image
      def initialize images
        @images = images
      end

      def build
        @images.collect do |image|
          Marver::Image.new(image)
        end
      end
    end
  end
end