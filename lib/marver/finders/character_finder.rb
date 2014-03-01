require './lib/marver.rb'

module Marver
  class CharacterFinder
    attr_reader :credentials, :rest_client

    def initialize(credentials)
      @credentials = credentials
      @rest_client = Marver::REST::Client.new
    end

    def find(options = {})
      response = @rest_client.get_request(url)
      Marver::Character.build(response, @credentials)
    end

    private

    def url
      "characters/?#{@credentials.to_s}"
    end
  end
end
