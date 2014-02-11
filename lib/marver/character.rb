require 'rest_client'

module Marver
  class Character

    class << self
      def build(response)
        if response.number_of_results > 0
          response.results.collect do |data|
            Character.new(data)
          end
        else
          Character.new(response.results)
        end
      end
    end

    attr_reader :id, :name, :description, :thumbnail, :comics

    def initialize(results)
      @id = results['id']
      @name = results['name'].strip
      @description = results['description']
      @thumbnail = build_thumbnail_url(results)
    end

    private

    def build_thumbnail_url(json)
      json['thumbnail']['path'] + '.' + json['thumbnail']['extension']
    end
  end
end
