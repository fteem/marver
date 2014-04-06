require './lib/marver.rb'

module Marver
  class CharacterFinder

    def initialize(credentials)
      @credentials = credentials
    end

    def find(options = {})
      response = Marver::API::Client.get("#{url}&#{qs}")
      results = Marver::DataContainer.new(response).results
      Marver::Character.build(results, @credentials)
    end

    private

    def url
      "characters?#{@credentials.to_s}"
    end
  end
end
