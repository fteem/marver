module Marver
  module Factory
    class Url
      def initialize(urls)
        @urls = urls
      end

      def build
        @urls.collect do |url|
          Marver::Url.new(url)
        end
      end
    end
  end
end