require './lib/marver.rb'

describe Marver::Client do
  describe '#characters' do
    before :each do
      raw_json = "{\"code\" : \"200\", \"status\": \"OK\", \"data\" : { \"count\" : \"2\", \"results\" : [{\"name\" : \"Hulk\", \"description\" : \"Lorem ipsum\", \"thumbnail\" : {\"path\" : \"some_path\", \"extension\" : \"png\"}, \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} }, {\"name\" : \"Captain America\", \"description\" : \"Lorem ipsum\", \"thumbnail\" : {\"path\" : \"cpt_america\", \"extension\" : \"png\"}, \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} }] }}"
      RestClient.stub(:get).and_return(raw_json)
      @client = Marver::Client.new('private_key', 'public_key')
    end

    it 'builds a list of characters' do
      characters = @client.characters
      expect(characters.class).to eq Array
      expect(characters.first.name).to eq "Hulk"
      expect(characters.last.name).to eq "Captain America"
    end
  end
end
