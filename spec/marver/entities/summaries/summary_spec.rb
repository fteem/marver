require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Summary do
  let(:credentials) { Marver::Credentials.new('pub_key', 'priv_key') }
  let(:entity) { Marver::Summary.new({ "name" => "Some story",
                    "resourceURI" => "http://example.net", "type" => "Story"}, credentials)}

  it '#name - the name of the entity' do
    expect(entity.name).to eq "Some story"
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(entity.resource_uri).to eq "http://example.net?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
  end

  it "#type - The type of the entity" do
    expect(entity.type).to eq "Story"
  end
end
