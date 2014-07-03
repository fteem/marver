require './lib/marver.rb'

module Marver
  module Factory
    class Story

      def initialize(results)
        @results = results
      end

      def build
        if @results.kind_of?(Array)
          @results.collect do |story|
            create_story(story)
          end
        else
          create_story(@results)
        end
      end

      private
      def create_story(params)
        attributes = StoryAttributesMapper.new(params).map
        Marver::Story.new(attributes: attributes)
      end
    end
  end
end