module Marver
  class EntityList
    attr_reader :available, :returned, :collection_uri, :items

    def initialize(json)
      @available = json['available'].to_i
      @returned = json['returned'].to_i
      @collection_uri = json['collectionURI']
    end

    private

    def build_items
    end
  end
end
