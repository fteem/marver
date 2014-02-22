require 'digest/md5'

module Marver
  class Credentials
    attr_reader :public_key, :private_key, :timestamp

    def initialize(public_key, private_key)
      @public_key  = public_key
      @private_key = private_key
      @timestamp = Time.now.to_i.to_s
    end

    def to_s
      "ts=#{@timestamp}&apikey=#{@public_key}&hash=#{md5_hash(@timestamp)}"
    end

    private

    def md5_hash(ts)
      Digest::MD5.hexdigest(@timestamp + @private_key + @public_key)
    end
  end
end
