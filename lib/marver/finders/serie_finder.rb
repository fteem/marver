require './lib/marver.rb'

module Marver
  class SerieFinder

    class << self
      def find(conditions = {})
        response = Marver::API::Client.new.get(:series, conditions)
        results = Marver::DataContainer.new(response).results
        Marver::Serie.build(results)
      end
    end

  end
end