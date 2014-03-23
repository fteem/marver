class String
  def to_class
    chain = self.split "::"
    klass = Kernel
    chain.each do |klass_string|
      klass = klass.const_get klass_string
    end
    klass.is_a?(Class) ? klass : nil
  rescue NameError
    nil
  end

end

require 'rest_client'
require './lib/marver/client.rb'
require './lib/marver/version.rb'
require './lib/marver/credentials.rb'
require './lib/marver/finders/character_finder.rb'

require './lib/marver/rest/client.rb'
require './lib/marver/rest/response.rb'
require './lib/marver/data_container.rb'

# WIP
require './lib/marver/helpers/string_helper.rb'
require './lib/marver/builders/core_entities_builder.rb'
require './lib/marver/builders/common_entities_builder.rb'

#Entities
require './lib/marver/entities/text_object.rb'
require './lib/marver/entities/image.rb'
require './lib/marver/entities/url.rb'
require './lib/marver/entities/key_date.rb'
require './lib/marver/entities/price.rb'
require './lib/marver/entities/core/event.rb'
require './lib/marver/entities/core/serie.rb'
require './lib/marver/entities/core/story.rb'
require './lib/marver/entities/core/character.rb'
require './lib/marver/entities/core/creator.rb'
require './lib/marver/entities/summaries/character_summary.rb'
require './lib/marver/entities/summaries/comic_summary.rb'
require './lib/marver/entities/summaries/story_summary.rb'
require './lib/marver/entities/summaries/event_summary.rb'
require './lib/marver/entities/summaries/serie_summary.rb'
require './lib/marver/entities/summaries/creator_summary.rb'
# require './lib/marver/entities/url.rb'
require './lib/marver/entities/core/comic.rb'
# require './lib/marver/entities/story.rb'
# require './lib/marver/entities/event.rb'
# require './lib/marver/entities/serie.rb'
