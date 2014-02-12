module Marver
  module REST
    class DataContainer
      attr_reader :offset, :limit, :total, :count, :results

      def initialize(json)
        @offset = json['offset'].to_i
        @limit  = json['limit'].to_i
        @total  = json['total'].to_i
        @count  = json['count'].to_i
        @results = json['results']
      end

    end
  end
end
