module Marver
  module StringHelper
    def summary_class(entity)
      constantize("Marver::#{refined(entity)}Summary")
    end

    def common_class(entity)
      constantize("Marver::#{refined(entity)}")
    end

    def parameterize(entity)
      entity.split(/(?=[A-Z])/).join('_').downcase
    end

    def refined(name)
      return "Comic" if name == 'originalIssue'
      return 'TextObject' if name == 'textObjects'
      return "KeyDate" if name == 'dates'
      return "Image" if name == 'thumbnail'
      return "Story" if name == 'stories'
      return name[0..-2].capitalize
    end

    def constantize(camel_cased_word)
      names = camel_cased_word.split('::')
      names.shift if names.empty? || names.first.empty?

      constant = Object
      names.each do |name|
        constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
      end
      constant
    end
  end

end
