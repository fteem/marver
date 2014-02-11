require 'spec_helper'
require './lib/marver/rest/client.rb'
require './lib/marver/rest/response.rb'

describe Marver::REST::Response do

  before :each do
    stub_get("characters").to_return(:body => fixture('raw_json.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    client = Marver::REST::Client.new('private_key', 'public_key')
    @response = client.call("characters")
  end

  it 'has a response code ' do
    expect(@response.code).to eq 200
  end

  it 'has a status' do
    expect(@response.status).to eq "OK"
  end

  context 'results' do
    it 'is an array' do
      expect(@response.results.class).to eq Array
    end

    it 'has Hulk in the array' do
      expect(@response.results.first['name']).to eq "Hulk"
    end
  end

  it 'has number of results' do
    expect(@response.number_of_results).to eq 2
  end
end
