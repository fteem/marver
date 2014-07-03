module Marver
  module Factory
    class Date
      def initialize dates
        @dates = dates
      end

      def build
        @dates.collect do |date|
          Marver::KeyDate.new(date)
        end
      end
    end
  end
end