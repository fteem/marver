require 'rest_client'
require 'json'
require 'digest/md5'
Dir["./lib/**/*.rb"].each {|file| require file }

module Marver
  class Base
    API_VERSION = "v1"
    API_ENDPOINT = "http://gateway.marvel.com"

    attr_reader :private_key, :public_key

    def initialize(private_key, public_key)
      @private_key = private_key
      @public_key = public_key
    end

    def characters(name = nil)
      url = build_url("characters")
      url += "&name=#{name}" unless name.nil?
      response = RestClient.get(url)
      raw_json  = JSON.parse(response)
      characters_json = raw_json['data']['results']
      if characters_json.length == 1
        Character.new(characters_json[0])
      else
        characters_json.collect do |character|
          Character.new(character)
        end
      end
    end

    private

    def build_url(noun)
      ts = Time.now.to_i.to_s
      "#{API_ENDPOINT}/#{API_VERSION}/public/#{noun}?ts=#{ts}&apikey=#{public_key}&hash=#{hash(ts)}"
    end

    def hash(ts)
      Digest::MD5.hexdigest(ts + private_key + public_key)
    end
  end
end
