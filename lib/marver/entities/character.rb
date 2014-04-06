require './lib/marver.rb'

module Marver
  class Character
    attr_reader :id, :resource_uri, :description, :urls, :name,
      :thumbnail, :comics, :stories, :events, :series, :json

    class << self
      def build(response)
        if response.kind_of?(Array)
          response.collect do |character|
            Marver::Character.new(character)
          end
        else
          new(response.results)
        end
      end
    end

    def initialize(json)
      @json = json

      @description = json['description']
      @id = json['id'].to_i
      @name = json['name']
      @resource_uri = json['resourceURI']

      CoreEntitiesBuilder.build!(self)
      CommonEntitiesBuilder.build!(self)
    end

  end
end
