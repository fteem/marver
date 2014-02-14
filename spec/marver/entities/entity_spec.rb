require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Entity do
  let(:entity) { Marver::Entity.new({ "name" => "Some story",
                    "resourceURI" => "http://example.net", "type" => "Story"})}

  it '#name - the name of the entity' do
    expect(entity.name).to eq "Some story"
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    expect(entity.resource_uri).to eq "http://example.net"
  end

  it "#type - The type of the entity" do
    expect(entity.type).to eq "Story"
  end

  describe '#load' do
    it 'fetches the full data from the API and builds an object' do
      pending
    end
  end
end
