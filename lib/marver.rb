require 'rest_client'
require 'time'
require 'marver/version'

module Marver
  FINDER_FILTERS = [ :orderBy, :limit, :offset ]

  # Base Classes
  autoload :Client,                 'marver/client'
  autoload :Configuration,          'marver/configuration'
  autoload :DataContainer,          'marver/data_container'

  # Finders
  autoload :CharacterFinder,        'marver/finders/character_finder'
  autoload :SerieFinder,            'marver/finders/serie_finder'
  autoload :ComicFinder,            'marver/finders/comic_finder'
  autoload :EventFinder,            'marver/finders/event_finder'
  autoload :StoryFinder,            'marver/finders/story_finder'
  autoload :CreatorFinder,          'marver/finders/creator_finder'

  #Factories
  autoload :Factory, 'marver/factories/factory'

  # API
  autoload :API,                   'marver/api'

  # Helpers & builders
  autoload :StringHelper,           'marver/utils/string_helper'
  autoload :FinderParamFilter,      'marver/utils/finder_param_filter'

  # Mappers
  autoload :Mappable,                   'marver/mappers/mappable'
  autoload :ComicAttributesMapper,      'marver/mappers/comic_attributes_mapper'
  autoload :CharacterAttributesMapper,  'marver/mappers/character_attributes_mapper'
  autoload :CreatorAttributesMapper,    'marver/mappers/creator_attributes_mapper'
  autoload :EventAttributesMapper,      'marver/mappers/event_attributes_mapper'
  autoload :SerieAttributesMapper,      'marver/mappers/serie_attributes_mapper'
  autoload :StoryAttributesMapper,      'marver/mappers/story_attributes_mapper'

  # Common Entities
  autoload :TextObject,   'marver/entities/text_object'
  autoload :Image,        'marver/entities/image'
  autoload :Url,          'marver/entities/url'
  autoload :KeyDate,      'marver/entities/key_date'
  autoload :Price,        'marver/entities/price'

  # Core Entities
  autoload :Event,     'marver/entities/event'
  autoload :Serie,     'marver/entities/serie'
  autoload :Story,     'marver/entities/story'
  autoload :Character, 'marver/entities/character'
  autoload :Creator,   'marver/entities/creator'
  autoload :Comic,     'marver/entities/comic'

  # Summary Entities
  autoload :Summary,    'marver/entities/summary'

  autoload :Summarizable, 'marver/entities/summarizable'
  autoload :Commonable,   'marver/entities/commonable'


  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end

