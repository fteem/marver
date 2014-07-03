require './lib/marver'

module Marver
  module Factory
    module Summary
      class Event
        def initialize results
          @results = results
        end

        def build
          if @results.kind_of?(Array)
            @results.collect do |event|
              Marver::Summary::Event.new(event)
            end
          else
            [Marver::Summary::Event.new(@results)]
          end
        end
      end
    end
  end
end