require './lib/marver'

module Marver
  module Factory
    module Summary
      class Character
        def initialize results
          @results = results
        end

        def build
          if @results.kind_of?(Array)
            @results.collect do |character|
              Marver::Summary::Character.new(character)
            end
          else
            [Marver::Summary::Character.new(@results)]
          end
        end
      end
    end
  end
end