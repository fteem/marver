module Marver
  class KeyDate
    attr_reader :type, :date

    def initialize(json)
      @type = json['type']
      @date = Date.parse(json['date'])
    end
  end
end
