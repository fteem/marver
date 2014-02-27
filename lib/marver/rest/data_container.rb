module Marver
  module REST
    class DataContainer
      attr_reader :offset, :limit, :total, :results

      def initialize(json_results)
        @offset = json_results['offset'].to_i
        @limit = json_results['limit'].to_i
        @total = json_results['total'].to_i
        @results = json_results['results']
      end
    end
  end
end
