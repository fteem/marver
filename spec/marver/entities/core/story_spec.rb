require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Story do
  describe "Attributes" do

    let(:credentials) { Marver::Credentials.new("priv_key", 'pub_key') }
    let(:json) { fixture('story.json').read }
    let(:response) { Marver::REST::Response.new(json) }
    let(:data_container) { Marver::DataContainer.new(response) }
    let(:story) { Marver::Story.new(data_container.results, credentials) }

    it "#title - The story title." do
      expect(story.title).to eq "Cover #892"
    end

    it "#type - The story type e.g. interior story, cover, text story." do
      expect(story.type).to eq "cover"
    end

    it "#resource_uri - The canonical URL identifier for this resource." do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      expect(story.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/892?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
    end

  end
end
