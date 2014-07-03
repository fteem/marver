require './lib/marver'

module Marver
  module Factory
    module Summary
      class Story
        def initialize results
          @results = results
        end

        def build
          if @results.kind_of?(Array)
            @results.collect do |story|
              Marver::Summary::Story.new(story)
            end
          else
            [Marver::Summary::Story.new(@results)]
          end
        end
      end
    end
  end
end