require './lib/marver.rb'

# TODO: Refactor, I guess?
module Marver
  module CommonEntitiesBuilder
    COMMON_ENTITIES = %w(prices images urls textObjects thumbnail dates)

    extend Marver::StringHelper

    def self.build!(object)
      COMMON_ENTITIES.each do |entity|
        # If the object's JSON has this entity..
        if object.json.has_key?(entity)
          # get the entity lists
          entities = entity_items(object, entity)
          # find the class for this type of entity
          klass = common_class(entity)
          # parameterize the entity string
          # i.e. textObjects => TextObject
          parameterized_entity = parameterize(entity)

          if entities.kind_of?(Array)
            object.class.send(:define_method, parameterized_entity) do
              entities.collect do |ent|
                klass.new(ent)
              end
            end
          else
            object.class.send(:define_method, parameterized_entity) do
              klass.new(entities)
            end
          end
        end
      end
    end

    def self.entity_items(object, entity)
      if object.json[entity].kind_of?(Hash) && object.json[entity].has_key?('items')
        [object.json[entity]['items']].compact.flatten(1)
      else
        object.json[entity]
      end
    end

  end
end
