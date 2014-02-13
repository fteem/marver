module Marver
  class Url
    attr_reader :type, :url

    def initialize(json)
      @type = json['type']
      @url = json['url']
    end
  end
end
