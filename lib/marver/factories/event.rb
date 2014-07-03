require './lib/marver.rb'

module Marver
  module Factory
    class Event
      
      def initialize(results)
        @results = results
      end

      def build
        if @results.kind_of?(Array)
          @results.collect do |event|
            create_event(event)
          end
        else
          create_event(@results)
        end
      end

      private
      def create_event(params)
        attributes = Marver::EventAttributesMapper.new(params).map
        Marver::Event.new(attributes: attributes)
      end
    end
  end
end