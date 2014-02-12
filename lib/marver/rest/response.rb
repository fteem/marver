require 'json'

module Marver
  module REST
    class Response
      attr_reader :code, :status, :data

      def initialize(raw_json)
        json  = JSON.parse(raw_json)
        @code = json['code'].to_i
        @status = json['status']
        @data = Marver::REST::DataContainer.new(json['data'])
      end

    end
  end
end
