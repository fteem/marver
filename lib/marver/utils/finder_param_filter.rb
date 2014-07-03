module Marver
  class FinderParamFilter
    class << self
      def filter!(params, allowed_params)
        unallowed = params.keys - allowed_params
        raise UnallowedParamsError.new("Unallowed params: #{unallowed}") unless unallowed.empty?
        return true
      end
    end
  end

  class UnallowedParamsError < Exception; end
end