module Marver
  class Url
    attr_reader :type, :url

    def initialize(attrs)
      @type = attrs['type']
      @url = attrs['url']
    end
  end
end
