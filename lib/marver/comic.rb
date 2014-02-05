module Marver
  class Comic
    attr_accessor :name

    def initialize(json)
      @name = json['name']
    end
  end
end
