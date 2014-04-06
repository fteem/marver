module Marver
  module API
    class Error
      attr_reader :code, :status

      def initialize(json)
        @code = json['code'].to_i
        @status = json['status']
      end

    end
  end
end
