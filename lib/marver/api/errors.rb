module Marver
  module API
    class ErrorHandler
      def initialize(ex)
        @message = ex.response['status']
      end

      def handle!
        case @code
        when 401
          raise Marver::Error::CredentialsFault.new(@message)
        when 403
          raise Marver::Error::MethodNotAllowed.new(@message)
        when 404
          raise Marver::Error::NotFound.new(@message)
        when 405
          raise Marver::Error::Forbidden.new(@message)
        when 409
          raise Marver::Error::Conflict.new(@message)
        end
      end
    end

  end

  module Error
    class Conflict < Exception; end
    class NotFound < Exception; end
    class CredentialsFault < Exception; end
    class MethodNotAllowed < Exception; end
    class Forbidden < Exception; end
  end
end
