require_relative '../../lib/marver.rb'

describe Marver::Response do

  let(:json) { "{\"code\" : \"200\", \"status\": \"OK\", \"data\" : { \"count\" : \"2\", \"results\" : [{\"name\" : \"Hulk\", \"description\" : \"Lorem ipsum\", \"thumbnail\" : {\"path\" : \"some_path\", \"extension\" : \"png\"}, \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} }, {\"name\" : \"Captain America\", \"description\" : \"Lorem ipsum\", \"thumbnail\" : {\"path\" : \"cpt_america\", \"extension\" : \"png\"}, \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} }] }}" }
  let(:response) { Marver::Response.new(json) }

  it 'has a response code ' do
    expect(response.code).to eq 200
  end

  it 'has a status' do
    expect(response.status).to eq "OK"
  end

  context 'results' do
    it 'is an array' do
      expect(response.results.class).to eq Array
    end

    it 'has Hulk in the array' do
      expect(response.results.first['name']).to eq "Hulk"
    end
  end

  it 'has number of results' do
    expect(response.number_of_results).to eq 2
  end
end
