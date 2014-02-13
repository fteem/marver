require 'json'
require 'webmock'
include WebMock::API

def stub_get(path)
    ts = Time.now.to_i.to_s
    hash = Digest::MD5.hexdigest(ts + 'private_key' + 'public_key')
    stub_request(:get, Marver::REST::Client::API_ENDPOINT + '/' + Marver::REST::Client::API_VERSION + '/public/' + path + "?ts=#{ts}&apikey=public_key&hash=#{hash}")
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
