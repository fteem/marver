require './lib/marver.rb'

module Marver
  class Character

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |character|
            Marver::Character.new(character, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    attr_reader :id, :resource_uri, :description, :urls, :name,
      :thumbnail, :comics, :stories, :events, :series, :json, :credentials

    def initialize(json, credentials)
      @credentials = credentials
      @json = json

      @description = json['description']
      @id = json['id'].to_i
      @credentials = credentials
      @name = json['name']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"

      CoreEntitiesBuilder.build!(self)
      CommonEntitiesBuilder.build!(self)
    end

  end
end
