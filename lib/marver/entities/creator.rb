module Marver
  class Creator
    include Marver::Summarizable
    include Marver::Commonable

    attr_reader :id, :first_name, :middle_name, :last_name, :full_name,
                :suffix, :resource_uri, :json

    class << self
      def build(response)
        if response.kind_of?(Array)
          response.collect do |creator|
            Marver::Creator.new(creator)
          end
        else
          new(response.results)
        end
      end
    end

    def initialize(json)
      @json = json
      @id = @json['id']
      @first_name = @json['firstName']
      @middle_name = @json['middleName']
      @last_name = @json['lastName']
      @full_name = @json['fullName']
      @suffix = @json['suffix']
      @resource_uri = @json['resourceURI']
    end

  end
end
