module Marver
  module API
    autoload :Client,      'marver/api/client'
    autoload :Response,    'marver/api/response'
    autoload :Credentials, 'marver/api/credentials'
    autoload :ErrorHandler, 'marver/api/errors'
  end

  module Error
    autoload :Conflict, 'marver/api/errors'
    autoload :NotFound, 'marver/api/errors'
    autoload :CredentialsFault, 'marver/api/errors'
    autoload :MethodNotAllowed, 'marver/api/errors'
    autoload :Forbidden, 'marver/api/errors'
  end
end
