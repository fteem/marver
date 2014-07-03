require './lib/marver.rb'

module Marver
  module Factory
    class Serie

      def initialize(results)
        @results = results
      end

      def build
        if @results.kind_of?(Array)
          @results.collect do |serie|
            create_serie(serie)
          end
        else
          create_serie(@results)
        end
      end

      private
      def create_serie(params)
        attributes = Marver::SerieAttributesMapper.new(params).map
        Marver::Serie.new(attributes: attributes)
      end
    end
  end
end