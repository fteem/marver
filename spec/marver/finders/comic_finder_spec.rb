require 'spec_helper'

describe Marver::ComicFinder do
  describe '#find' do 
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get("http://gateway.marvel.com/v1/public/comics?apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819&name=The%20Avengers&ts=1").to_return(:body => fixture('comic.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

      Marver.configure do |config|
        config.public_key = 'pub_key'
        config.private_key = 'priv_key'
      end
    end

    it 'builds a Comic out of the received json' do
      expect(Marver::ComicFinder.new.find({ name: 'The Avengers' })).to be_kind_of(Marver::Comic)
    end
  end
end