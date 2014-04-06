require 'rest_client'
require 'marver/version'

module Marver

  # Base Classes
  autoload :Client,                 'marver/client'
  autoload :Configuration,          'marver/configuration'
  autoload :DataContainer,          'marver/data_container'

  # Finders
  autoload :CharacterFinder,        'marver/finders/character_finder'

  # API
  autoload :API,                   'marver/api'

  # Helpers & builders
  autoload :StringHelper,           'marver/helpers/string_helper'
  autoload :CoreEntitiesBuilder,    'marver/builders/core_entities_builder'
  autoload :CommonEntitiesBuilder,  'marver/builders/common_entities_builder'

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

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end

