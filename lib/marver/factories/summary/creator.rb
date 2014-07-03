require './lib/marver'

module Marver
  module Factory
    module Summary
      class Creator
        def initialize(results)
          @results = results
        end

        def build
          if @results.kind_of?(Array)
            @results.collect do |creator|
              Marver::Summary::Creator.new(creator)
            end
          else
            [Marver::Summary::Creator.new(@results)]
          end
        end
      end
    end
  end
end