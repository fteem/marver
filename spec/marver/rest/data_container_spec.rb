require './lib/marver/rest/data_container.rb'

describe Marver::REST::DataContainer do
  let(:data_container) { Marver::REST::DataContainer.new({
                          "offset" => "20",
                          "limit"  => "10",
                          "total"  => "100",
                          "count"  => "80",
                          "results" => [double, double]}) }

  it '#offset - requested offset (skipped results) of the call' do
    expect(data_container.offset).to eq 20
  end

  it '#limit - requested result limit' do
    expect(data_container.limit).to eq 10
  end

  it '#total - total number of results available' do
    expect(data_container.total).to eq 100
  end

  it '#count - total number of results returned by this call' do
    expect(data_container.count).to eq 80
  end

  it '#results - list of entities returned by the call' do
    expect(data_container.results.class).to eq Array
  end

end
