require 'rest_client'

# Base Classes
require './lib/marver/client.rb'
require './lib/marver/version.rb'
require './lib/marver/credentials.rb'
require './lib/marver/data_container.rb'

# Finders
require './lib/marver/finders/character_finder.rb'

# REST
require './lib/marver/rest/client.rb'
require './lib/marver/rest/response.rb'

# Helpers & builders
require './lib/marver/helpers/string_helper.rb'
require './lib/marver/builders/core_entities_builder.rb'
require './lib/marver/builders/common_entities_builder.rb'

# Common Entities
require './lib/marver/entities/common/text_object.rb'
require './lib/marver/entities/common/image.rb'
require './lib/marver/entities/common/url.rb'
require './lib/marver/entities/common/key_date.rb'
require './lib/marver/entities/common/price.rb'

# Core Entities
require './lib/marver/entities/core/event.rb'
require './lib/marver/entities/core/serie.rb'
require './lib/marver/entities/core/story.rb'
require './lib/marver/entities/core/character.rb'
require './lib/marver/entities/core/creator.rb'
require './lib/marver/entities/core/comic.rb'

# Summary Entities
require './lib/marver/entities/summaries/character_summary.rb'
require './lib/marver/entities/summaries/comic_summary.rb'
require './lib/marver/entities/summaries/story_summary.rb'
require './lib/marver/entities/summaries/event_summary.rb'
require './lib/marver/entities/summaries/serie_summary.rb'
require './lib/marver/entities/summaries/creator_summary.rb'
