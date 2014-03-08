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
      :thumbnail, :comics, :stories, :events, :series



    def initialize(json, credentials)
      @credentials = credentials
      @json = json

      @description = json['description']
      @id = json['id'].to_i
      @credentials = credentials
      @name = json['name']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"

      @urls = build_urls_list(json)
      @thumbnail = build_thumbnail_url(json)

      build_entities
    end

    def build_entities
      %w(comics stories characters events series).each do |entity|
        if @json.has_key?(entity)
          self.class.send(:define_method, entity) do
            @json[entity]['items'].collect do |ent|
              eval("Marver::#{refined_entity(entity)}Summary").new(ent, @credentials)
            end
          end
        end
      end
    end

    def refined_entity(name)
      return "Story" if name == 'stories'
      return name[0..-2].capitalize
    end

    private

    def build_urls_list(json)
      json['urls'].collect do |url|
        Marver::Url.new(url)
      end
    end

    def build_thumbnail_url(json)
      json['thumbnail']['path'] + '.' + json['thumbnail']['extension']
    end

  end
end
