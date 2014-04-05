module Marver
  class Image
    attr_reader :full_path

    def initialize(json)
      @full_path = json['path'] + '.' + json['extension']
    end
  end
end
