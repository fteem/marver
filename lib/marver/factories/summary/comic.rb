require './lib/marver'

module Marver
  module Factory
    module Summary
      class Comic
        def initialize results
          @results = results
        end

        def build
          if @results.kind_of?(Array)
            @results.collect do |comic|
              Marver::Summary::Comic.new(comic)
            end
          else
            [Marver::Summary::Comic.new(@results)]
          end
        end
      end
    end
  end
end