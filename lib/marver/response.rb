require 'json'

module Marver
  class Response
    attr_reader :results, :code, :status, :number_of_results

    def initialize(raw_json)
      json  = JSON.parse(raw_json)
      @results = json['data']['results']
      @code = json['code'].to_i
      @status = json['status']
      @number_of_results = json['data']['count'].to_i
    end

  end
end
