module Marver
  class Comic
    attr_reader :id, :name

    def initialize(json)
      @id   = json['id']
      @name = json['name']
    end
  end
end
