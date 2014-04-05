module Marver
  class Creator
    attr_reader :id, :first_name, :middle_name, :last_name, :full_name,
                :suffix, :resource_uri, :json, :credentials

    class << self
      def build(response, credentials)
        if response.kind_of?(Array)
          response.collect do |creator|
            Marver::Creator.new(creator, credentials)
          end
        else
          new(response.results, credentials)
        end
      end
    end

    def initialize(json, credentials)
      @json = json
      @credentials = credentials

      @id = @json['id']
      @first_name = @json['firstName']
      @middle_name = @json['middleName']
      @last_name = @json['lastName']
      @full_name = @json['fullName']
      @suffix = @json['suffix']

      @resource_uri = @json['resourceURI']

      CommonEntitiesBuilder.build!(self)
      CoreEntitiesBuilder.build!(self)
    end

  end
end
