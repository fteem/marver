require_relative 'summary'

module Marver
  class EventSummary < Summary
    attr_reader :id

    def initialize(json, credentials)
      @id = json['id'].to_i
      super(json, credentials)
    end

  end
end
