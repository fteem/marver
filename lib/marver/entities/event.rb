module Marver
  class Event
    attr_reader :json, :title, :resource_uri,
                :description, :start, :end, :next, :previous

    class << self
      def build(response)
        if response.kind_of?(Array)
          response.collect do |event|
            Marver::Event.new(event)
          end
        else
          new(response.results)
        end
      end
    end

    def initialize(json)
      @json = json

      @title = @json['title']
      @resource_uri = @json['resourceURI']

      @description = @json['description']
      @start = Date.parse(@json['start'])
      @end = Date.parse(@json['end'])
      @next = Marver::Summary::Event.new(@json['next'])
      @previous = Marver::Summary::Event.new(@json['previous'])

      CommonEntitiesBuilder.build!(self)
      CoreEntitiesBuilder.build!(self)
    end
  end
end
