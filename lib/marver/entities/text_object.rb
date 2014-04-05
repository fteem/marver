module Marver
  class TextObject
    attr_reader :type, :language, :text

    def initialize(json)
      @type = json['type']
      @language = json['language']
      @text = json['text']
    end
  end
end
