require 'spec_helper'

describe Marver::Summary::Story do
  let(:story_summary) { Marver::Summary::Story.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" }) }

  it '#id' do
    expect(story_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(story_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(story_summary.type).to eq nil
  end

  it '#name' do
    expect(story_summary.name).to eq "Hulk"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do
      pending
    end
  end
end
