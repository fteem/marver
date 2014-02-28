require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Story do
  describe "Attributes" do

    let(:credentials) { Marver::Credentials.new("priv_key", 'pub_key') }
    let(:story) { Marver::Story.new({
              "resourceURI" => "http://gateway.marvel.com/v1/public/stories/703",
              "name" => "Interior #703", "type" => "interiorStory" }, credentials)
                }

    it "#name - The story title." do
      expect(story.name).to eq "Interior #703"
    end

    it "#type - The story type e.g. interior story, cover, text story." do
      expect(story.type).to eq "interiorStory"
    end

    it "#resource_uri - The canonical URL identifier for this resource." do
      expect(story.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/703"
    end

  end
end
