module Marver
  class Creator
    attr_reader :id, :first_name, :middle_name, :last_name, :full_name, :urls,
                :suffix, :resource_uri, :series, :stories, :comics, :events, :thumbnail

    def initialize(attributes)
      attributes.each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
