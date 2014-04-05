module Marver
  class Serie
    attr_reader :json, :credentials, :id, :title, :resource_uri, :description,
                :start_year, :end_year, :rating, :next, :previous

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |serie|
            Marver::Serie.new(serie, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    def initialize(json, credentials)
      @json = json
      @credentials = credentials

      @id = @json['id']
      @title = @json['title']
      @resource_uri = @json['resourceURI']
      @description = @json['description']
      @start_year = @json['startYear']
      @end_year = @json['endYear']
      @rating = @json['rating']

      @next = Marver::Summary::Serie.new(@json['next'], @credentials)
      @previous = Marver::Summary::Serie.new(@json['previous'], @credentials)

      CommonEntitiesBuilder.build!(self)
      CoreEntitiesBuilder.build!(self)
    end
  end
end
