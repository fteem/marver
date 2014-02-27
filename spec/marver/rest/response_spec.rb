require 'spec_helper'
require './lib/marver/rest/client.rb'
require './lib/marver/rest/response.rb'

describe Marver::REST::Response do

  before :each do
    stub_get("http://gateway.marvel.com/v1/public/characters").to_return(:body => fixture('raw_json.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    client = Marver::REST::Client.new
    @response = client.get_request('characters')
  end

  it 'has a response code ' do
    expect(@response.code).to eq 200
  end

  it 'has a status' do
    expect(@response.status).to eq "Ok"
  end

end
