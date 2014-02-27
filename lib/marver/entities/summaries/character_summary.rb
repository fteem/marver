require './lib/marver.rb'

module Marver
  class CharacterSummary
    attr_reader :id, :name, :resource_uri, :type

    def initialize(json, credentials)
      @id = json['id'].to_i
      @credentials = credentials
      @name = json['name']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
      @type = json['type'] || nil
    end

    def full
      url = "#{@resource_uri}?#{@credentials.to_s}"
      response = Marver::REST::Response.new(RestClient.get(url))
      Marver::Character.build(response, @credentials)
    end

  end
end
