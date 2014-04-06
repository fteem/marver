require 'spec_helper'

describe Marver::API::Response do

  before :each do
    stub_get("http://gateway.marvel.com/v1/public/characters?apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819&ts=1").to_return(:body => fixture('raw_json.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    Marver.configure do |config|
      config.public_key  = 'pub_key'
      config.private_key = 'priv_key'
    end

    @response = Marver::API::Client.get('characters')
  end

  it 'has a response code ' do
    expect(@response.code).to eq 200
  end

  it 'has a status' do
    expect(@response.status).to eq "Ok"
  end

end
