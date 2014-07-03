require './lib/marver.rb'

module Marver
  class Comic
    attr_reader :id, :title, :stories, :series, :events, :characters, :variant_description,
      :images, :ean, :format, :resource_uri, :stories, :text_objects, :digital_id,
      :isbn, :diamond_code, :thumbnail, :upc, :issue_number, :prices, :issn, :dates,
      :urls, :page_count, :description, :creators

    def initialize(args)
      @series     = args[:series]
      @stories    = args[:stories]
      @creators   = args[:creators]
      @events     = args[:events]
      @characters = args[:characters]
      @urls       = args[:urls]
      @prices     = args[:prices]
      @images     = args[:images]
      @thumbnail  = args[:thumbnail]
      @text_objects = args[:text_objects]
      @dates = args[:dates]

      args[:attributes].each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end