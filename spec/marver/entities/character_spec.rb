require 'spec_helper'
require './lib/marver/entities/character.rb'

describe Marver::Character do

  describe 'Attributes' do
    let(:json) { JSON.parse(fixture('character.json').read) }
    let(:character) { Marver::Character.new(json) }

    it '#id - The unique ID of the character resource' do
      expect(character.id).to eq 1009351
    end

    it '#name - The name of the character.' do
      expect(character.name).to eq "Hulk"
    end

    it '#description - A short bio or description of the character.' do
      expect(character.description).to eq "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets."
    end

    it '#resourceURI - The canonical URL identifier for this resource.' do
      expect(character.resource_uri).to eq "http://gateway.marvel.com/v1/public/characters/1009351"
    end

    it '#urls - A set of public web site URLs for the resource.' do
      expect(character.urls.class).to eq Array
      expect(character.urls.first.type).to eq "detail"
      expect(character.urls.first.url).to eq "http://marvel.com/comics/characters/1009351/hulk?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7"
    end

    it '#thumbnail - The representative image for this character.' do
      expect(character.thumbnail).to eq "http://i.annihil.us/u/prod/marvel/i/mg/c/03/526039b477c92.jpg"
    end

    it '#comics - A resource list containing comics which feature this character.' do
      expect(character.comics.class).to eq Array
      expect(character.comics.first.class).to eq Marver::Entity
      expect(character.comics.first.name).to eq "5 Ronin (Hardcover)"
      expect(character.comics.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/comics/41112"
    end

    it '#stories - A resource list of stories in which this character appears.' do
      expect(character.stories.class).to eq Array
      expect(character.stories.first.class).to eq Marver::Entity
      expect(character.stories.first.name).to eq "Interior #703"
      expect(character.stories.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/703"
      expect(character.stories.first.type).to eq "interiorStory"
    end

    it '#events - A resource list of events in which this character appears.' do
      expect(character.events.class).to eq Array
      expect(character.events.first.class).to eq Marver::Entity
      expect(character.events.first.name).to eq "Acts of Vengeance!"
      expect(character.events.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/events/116"
    end

    it '#series - A resource list of series in which this character appears.' do
      expect(character.series.class).to eq Array
      expect(character.series.first.class).to eq Marver::Entity
      expect(character.series.first.name).to eq "5 Ronin (2010)"
      expect(character.series.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/12429"
    end
  end
end
