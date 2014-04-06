require 'spec_helper'

describe Marver::Summary::Serie do
  let(:series_summary) { Marver::Summary::Serie.new({ "resourceURI" => "http://example.net", "name" => "Hulk" }) }

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(series_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(series_summary.type).to eq nil
  end

  it '#name' do
    expect(series_summary.name).to eq "Hulk"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do
      pending
    end
  end
end
