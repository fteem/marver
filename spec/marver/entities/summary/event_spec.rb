require 'spec_helper'

describe Marver::Summary::Event do
  let(:event_summary) { Marver::Summary::Event.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Breathing" }) }

  it '#id' do
    expect(event_summary.id).to eq 123
  end

  it '#resource_uri' do
    expect(event_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(event_summary.type).to eq nil
  end

  it '#name' do
    expect(event_summary.name).to eq "Breathing"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do
      pending
    end
  end
end
