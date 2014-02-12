require_relative 'rest/client.rb'
require_relative 'rest/response.rb'
require_relative 'character'

module Marver
  class Client
    attr_reader :rest_client

    def initialize(private_key, public_key)
      @rest_client = Marver::REST::Client.new(private_key, public_key)
    end

    def characters
      result = rest_client.call("characters")
      Marver::Character.build(result)
    end

  end
end
