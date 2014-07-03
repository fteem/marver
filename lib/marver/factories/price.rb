module Marver
  module Factory
    class Price
      def initialize(prices)
        @prices = prices
      end

      def build
        @prices.collect do |price|
          Marver::Price.new(price)
        end
      end
    end
  end
end