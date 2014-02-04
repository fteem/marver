require 'rest_client'
require 'digest/md5'

class Marver
  API_VERSION = "v1"
  API_ENDPOINT = "http://gateway.marvel.com"

  attr_reader :private_key, :public_key

  def initialize(private_key, public_key)
    @private_key = private_key
    @public_key = public_key
  end

  def characters(name = nil)
    endpoint = build_url("characters")
    endpoint = endpoint + "&name=#{name}" unless name.nil?
    response = RestClient.get endpoint
  end

  private

  def build_url(noun)
    ts = Time.now.to_i.to_s
    hash = Digest::MD5.hexdigest(ts + private_key + public_key)
    "#{API_ENDPOINT}/#{API_VERSION}/public/#{noun}?ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
  end
end
