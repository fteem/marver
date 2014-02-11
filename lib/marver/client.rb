module Marver
  class Client
    attr_reader :rest_client

    def initialize(private_key, public_key)
      @rest_client = Marver::REST::Client.new(private_key, public_key)
    end

    def characters
      rest_client.call("characters")
    end

  end
end
