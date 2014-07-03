module Marver
  class StringHelper
    def self.parameterize(string)
      string.split(/(?=[A-Z])/).join('_').downcase
    end
  end
end