require './lib/marver.rb'

describe Marver::REST::DataContainer do
  let(:data_container) { Marver::REST::DataContainer.new({ "offset" => 0, "limit" => 20, "total" => 1, "count" => 1, "results" => [double(:entity), double(:entity)]}) }

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
    expect(data_container.results.class).to eq Array
  end
end
