module Marver
  class Configuration
    attr_accessor :public_key, :private_key

    def initialize
      @public_key  = 'your_public_key_here'
      @private_key  = 'your_private_key_here'
    end
  end
end
