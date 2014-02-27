module Marver
  class Price
    attr_reader :type, :price

    def initialize(json)
      @type = json['type']
      @price = json['price']
    end
  end
end
