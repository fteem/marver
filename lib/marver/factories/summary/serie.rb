require './lib/marver'

module Marver
  module Factory
    module Summary
      class Serie
        def initialize results
          @results = results
        end

        def build
          if @results.kind_of?(Array)
            @results.collect do |serie|
              Marver::Summary::Serie.new(serie)
            end
          else
            [Marver::Summary::Serie.new(@results)]
          end
        end
      end
    end
  end
end