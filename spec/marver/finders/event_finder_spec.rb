require 'spec_helper'

describe Marver::EventFinder do
  describe '#find' do 
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get("http://gateway.marvel.com/v1/public/events?apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819&title=Fall%20of%20the%20Mutants&ts=1").to_return(:body => fixture('event.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

      Marver.configure do |config|
        config.public_key = 'pub_key'
        config.private_key = 'priv_key'
      end
    end

    it 'builds an Event out of the received json' do
      expect(Marver::EventFinder.find({ title: 'Fall of the Mutants' })).to be_kind_of(Marver::Event)
    end
  end
end