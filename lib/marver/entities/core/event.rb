module Marver
  class Event
    attr_reader :json, :credentials, :title, :resource_uri,
                :description, :start, :end, :next, :previous

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |event|
            Marver::Event.new(event, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    def initialize(json, credentials)
      @credentials = credentials
      @json = json

      @title = @json['title']
      @resource_uri = "#{@json['resourceURI']}?#{@credentials.to_s}"

      @description = @json['description']
      @start = Date.parse(@json['start'])
      @end = Date.parse(@json['end'])
      @next = Marver::EventSummary.new(@json['next'], @credentials)
      @previous = Marver::EventSummary.new(@json['previous'], @credentials)

      CommonEntitiesBuilder.build!(self)
      CoreEntitiesBuilder.build!(self)
    end
  end
end
