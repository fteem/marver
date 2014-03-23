require './lib/marver.rb'

module Marver
  class Comic
    attr_reader :json, :credentials, :id, :digital_id, :title, :issue_number,
                :variant_description, :description, :isbn,
                :upc, :diamond_code, :ean, :issn, :format,
                :page_count, :resource_uri, :thumbnail, :text_objects


    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |comic|
            new(comic, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    def initialize(json, credentials)
      @json = json
      @credentials = credentials
      @title = json['title']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
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

      CoreEntitiesBuilder.build!(self)
      CommonEntitiesBuilder.build!(self)
    end

  end
end
