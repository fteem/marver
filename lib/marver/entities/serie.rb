module Marver
  class Serie
    include Marver::Summarizable
    include Marver::Commonable

    attr_reader :json, :id, :title, :resource_uri, :description,
                :start_year, :end_year, :rating, :next, :previous

    class << self
      def build(response)
        if response.kind_of?(Array)
          response.collect do |serie|
            Marver::Serie.new(serie)
          end
        else
          new(response.results)
        end
      end
    end

    def initialize(json)
      @json = json

      @id = @json['id']
      @title = @json['title']
      @resource_uri = @json['resourceURI']
      @description = @json['description']
      @start_year = @json['startYear']
      @end_year = @json['endYear']
      @rating = @json['rating']

      @next = Marver::Summary::Serie.new(@json['next'])
      @previous = Marver::Summary::Serie.new(@json['previous'])
    end
  end
end
