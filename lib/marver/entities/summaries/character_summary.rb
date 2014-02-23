require_relative 'summary'

module Marver
  class CharacterSummary < Summary
    attr_reader :id

    def initialize(json, credentials)
      @id = json['id'].to_i
      super(json, credentials)
    end

  end
end
