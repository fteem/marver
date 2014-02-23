require_relative '../../spec_helper'
require './lib/marver/entities/character_summary'

describe Marver::CharacterSummary do
  let(:character_summary) { Marver::CharacterSummary.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" }) }

  it '#id' do
    expect(character_summary.id).to eq 123
  end

  it '#resource_uri' do
    expect(character_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(character_summary.type).to eq nil
  end

  it '#name' do
    expect(character_summary.name).to eq "Hulk"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do
      pending
    end
  end
end
