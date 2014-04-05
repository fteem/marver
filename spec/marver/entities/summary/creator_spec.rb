require 'spec_helper'

describe Marver::Summary::Creator do
  before :each do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    credentials = Marver::Credentials.new('priv_key', 'pub_key')
    @creator = Marver::Summary::Creator.new({
                "resourceURI" => "http://gateway.marvel.com/v1/public/creators/648", "name" => "Simone Bianchi", "role" => "penciller (cover)"
              }, credentials)
  end

  it "#name - creator's name" do
    expect(@creator.name).to eq "Simone Bianchi"
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    expect(@creator.resource_uri).to eq "http://gateway.marvel.com/v1/public/creators/648?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
  end

  it '#role - the role this creator took' do
    expect(@creator.role).to eq "penciller (cover)"
  end
end
