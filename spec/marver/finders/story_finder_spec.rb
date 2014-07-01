require 'spec_helper'

describe Marver::StoryFinder do
  describe '#find' do 

    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get("http://gateway.marvel.com/v1/public/stories?apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819&name=Cover%20%23892&ts=1").to_return(:body => fixture('story.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

      Marver.configure do |config|
        config.public_key = 'pub_key'
        config.private_key = 'priv_key'
      end
    end

    it 'builds a Story out of the received json' do
      expect(Marver::StoryFinder.find({ name: 'Cover #892' })).to be_kind_of(Marver::Story)
    end
  end
end