#
# THIS NEEDS TO BE A CLASS, FUCK MODULES.
#

module Marver
  module SummariesListBuilder
    def build_summary_lists
      %w(series comics creators stories characters events).each do |entity|
        if self.json.has_key?(entity)
          self.class.send(:define_method, entity) do
            entity_items(entity).collect do |ent|
              summary_class(entity).new(ent, self.credentials)
            end
          end
        end
      end
    end

    def build_supporting_entities
      %w(prices images urls textObjects dates).each do |entity|
        if self.json.has_key?(entity)
          self.class.send(:define_method, parameterize(entity)) do
            entity_items(entity).collect do |ent|
              eval("Marver::#{refined(entity)}").new(ent)
            end
          end
        end
      end
    end

    def build_thumbnail
      if self.json.has_key? 'thumbnail'
        self.class.send(:define_method, 'thumbnail') do
          eval("Marver::#{refined('thumbnail')}").new(self.json['thumbnail'])
        end
      end
    end

    def entity_items(entity)
      if self.json[entity].kind_of?(Hash) && self.json[entity].has_key?('items')
        [self.json[entity]['items']].compact.flatten(1)
      else
        [self.json[entity]].compact.flatten(1)
      end
    end

    def summary_class(entity)
      eval("Marver::#{refined(entity)}Summary")
    end

    def refined(name)
      return 'TextObject' if name == 'textObjects'
      return "KeyDate" if name == 'dates'
      return "Image" if name == 'thumbnail'
      return "Story" if name == 'stories'
      return name[0..-2].capitalize
    end

    def parameterize(string)
      string.split(/(?=[A-Z])/).map(&:downcase).join('_')
    end

  end
end
