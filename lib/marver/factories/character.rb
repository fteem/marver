require './lib/marver.rb'

module Marver
  module Factory
    class Character

      def initialize(results)
        @results = results
      end

      def build
        if @results.kind_of?(Array)
          @results.collect do |character|
            create_character(character)
          end
        else
          create_character(@results)
        end
      end

      private
      def create_character(params)
        attributes = Marver::CharacterAttributesMapper.new(params).map
        Marver::Character.new(attributes: attributes)
      end
    end
  end
end