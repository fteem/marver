module Marver
  class Event
    include Marver::Summarizable
    include Marver::Commonable

    attr_reader :json, :title, :resource_uri,
                :description, :start, :end, :next, :previous

    class << self
      def build(results)
        if results.kind_of?(Array)
          results.collect do |event|
            Marver::Event.new(event)
          end
        else
          new(results)
        end
      end
    end

    def initialize(json)
      @json = json

      @title = @json['title']
      @resource_uri = @json['resourceURI']

      @description = @json['description']
      @start = DateTime.parse(@json['start'])
      @end = DateTime.parse(@json['end'])
      @next = Marver::Summary::Event.new(@json['next'])
      @previous = Marver::Summary::Event.new(@json['previous'])
    end
  end
end
