require './lib/marver.rb'

module Marver
  class Comic
    include Marver::Summarizable
    include Marver::Commonable

    attr_reader :json, :id, :digital_id, :title, :issue_number,
                :variant_description, :description, :isbn,
                :upc, :diamond_code, :ean, :issn, :format,
                :page_count, :resource_uri

    class << self
      def build(results)
        if results.kind_of?(Array)
          results.collect do |comic|
            Marver::Comic.new(comic)
          end
        else
          new(results)
        end
      end
    end

    def initialize(json)
      @json = json
      @title = json['title']
      @resource_uri = json['resourceURI']
      @id = json['id'].to_i
      @digital_id = json['digitalId']
      @issue_number = json['issueNumber']
      @variant_description = json['variantDescription']
      @description = json['description']
      @isbn = json['isbn']
      @upc = json['upc']
      @diamond_code = json['diamondCode']
      @ean = json['ean']
      @issn = json['issn']
      @format = json['format']
      @page_count = json['pageCount']
    end

  end
end
