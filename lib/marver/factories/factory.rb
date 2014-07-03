module Marver
  module Factory
    autoload :Character,  'marver/factories/character'
    autoload :Comic,      'marver/factories/comic'
    autoload :Story,      'marver/factories/story'
    autoload :Event,      'marver/factories/event'
    autoload :Serie,      'marver/factories/serie'
    autoload :Creator,    'marver/factories/creator'

    autoload :Url,        'marver/factories/url'
    autoload :Price,      'marver/factories/price'
    autoload :Image,      'marver/factories/image'
    autoload :TextObject, 'marver/factories/text_object'  
    autoload :Date,       'marver/factories/date'

    autoload :Summary,    'marver/factories/summary/summary'

    autoload :Buildable,  'marver/factories/buildable' 
  end
end
