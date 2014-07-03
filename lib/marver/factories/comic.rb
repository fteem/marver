require './lib/marver.rb'

module Marver
  module Factory
    class Comic
      def initialize(results)
        @results = results
      end

      def build
        if @results.kind_of?(Array)
          @results.collect do |comic|
            create_comic(comic)
          end
        else
          create_comic(@results)
        end
      end

      private
      def create_comic(params)
        attributes = ComicAttributesMapper.new(params).map
        Marver::Comic.new(attributes: attributes)
      end
    end
  end
end