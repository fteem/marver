module Marver
  class DataContainer
    attr_reader :offset, :limit, :total, :results

    def initialize(response)
      json_results = response.data

      @offset = json_results['offset'].to_i
      @limit = json_results['limit'].to_i
      @total = json_results['total'].to_i
      if @total == 1
        @results = json_results['results'].first
      else
        @results = json_results['results']
      end
    end
  end
end
