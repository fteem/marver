require './lib/marver.rb'

module Marver
  class Character
    include Marver::Summarizable
    include Marver::Commonable

    attr_reader :json, :id, :resource_uri, :description, :name

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
    end

  end
end
