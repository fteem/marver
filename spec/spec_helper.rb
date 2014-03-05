require 'json'
require 'webmock'
require './lib/marver.rb'

include WebMock::API

def stub_get(path)
    stub_request(:get, path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
