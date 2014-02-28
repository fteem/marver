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
      response = Marver::REST::Response.new(RestClient.get(@resource_uri))
      data = Marver::DataContainer.new(response)
      Marver::Character.build(data, @credentials)
    end

  end
end
