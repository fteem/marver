require_relative 'entity.rb'

module Marver
  class Comic < Entity
    attr_reader :id

    def initialize(json)
      @id = json['id']
      super(json)
    end
  end
end
