require 'json'

module Marver
  module REST
    class Response
      attr_reader :code, :status, :data, :results

      def initialize(raw_json)
        json  = JSON.parse(raw_json)
        @code = json['code'].to_i
        @status = json['status']
        @data = json['data']
        @results = @data['results']
      end

    end
  end
end
