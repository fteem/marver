require './lib/marver.rb'

describe Marver::DataContainer do
  let(:response) { Marver::REST::Response.new("{ \"code\": 200, \"status\": \"Ok\", \"etag\": \"ec5ab621cf3760eb6f2df2e6270ccb56c6debfb7\", \"data\": { \"offset\": 0, \"limit\": 20, \"total\": 1, \"count\": 1, \"results\": [1]}}") }

  let(:data_container) { Marver::DataContainer.new(response) }

  it '#offset' do
    expect(data_container.offset).to eq 0
  end

  it '#limit' do
    expect(data_container.limit).to eq 20
  end

  it '#total' do
    expect(data_container.total).to eq 1
  end

  it '#results' do
    expect(data_container.results.class).to eq Fixnum
  end
end
