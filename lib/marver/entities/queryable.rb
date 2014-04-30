require './lib/marver.rb'

module Marver
  module Queryable
    def hash_to_querystring(hash)
      hash.keys.inject('') do |query_string, key|
        query_string << '&' unless key == hash.keys.first
        query_string << "#{URI.encode(key.to_s)}=#{URI.encode(hash[key])}"
      end
    end
  end
end
