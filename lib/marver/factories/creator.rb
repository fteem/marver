require './lib/marver.rb'

module Marver
  module Factory
    class Creator

      def initialize(results)
        @results = results
      end

      def build
        if @results.kind_of?(Array)
          @results.collect do |creator|
            create_creator(creator)
          end
        else
          create_creator(@results)
        end
      end

      private
      def create_creator(params)
        attributes = CreatorAttributesMapper.new(params).map
        Marver::Creator.new(attributes)
      end
    end
  end
end