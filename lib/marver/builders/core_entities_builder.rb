require './lib/marver.rb'

# TODO: Refactor, I guess?
module Marver
  module CoreEntitiesBuilder
    CORE_ENTITIES = %w(comics series creators stories characters events)

    extend Marver::StringHelper

    def self.build!(object)
      CORE_ENTITIES.each do |entity|
        if object.json.has_key?(entity)
          klass = self.summary_class(entity)
          entity_items = self.entity_items(object, entity)

          object.class.send(:define_method, entity) do
            entity_items.collect do |ent|
              klass.new(ent)
            end
          end
        end
      end
    end

    def self.entity_items(object, entity)
      if object.json[entity].kind_of?(Hash) && object.json[entity].has_key?('items')
        [object.json[entity]['items']].compact.flatten(1)
      else
        [object.json[entity]].compact.flatten(1)
      end
    end

  end
end
