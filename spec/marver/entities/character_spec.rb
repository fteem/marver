require 'spec_helper'

describe Marver::Character do

  describe 'Attributes' do
    let(:json) { fixture('character.json').read }
    let(:response) { Marver::REST::Response.new(json) }
    let(:credentials) { Marver::Credentials.new('pub_key', 'priv_key') }
    let(:data_container) { Marver::DataContainer.new(response) }
    let(:character) { Marver::Character.new(data_container.results, credentials) }

    it '#id - The unique ID of the character resource' do
      expect(character.id).to eq 1009220
    end

    it '#name - The name of the character.' do
      expect(character.name).to eq "Captain America"
    end

    it '#description - A short bio or description of the character.' do
      expect(character.description).to eq "Vowing to serve his country any way he could, young Steve Rogers took the super soldier serum to become America's one-man army. Fighting for the red, white and blue for over 60 years, Captain America is the living, breathing symbol of freedom and liberty."
    end

    it '#resourceURI - The canonical URL identifier for this resource.' do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      expect(character.resource_uri).to eq "http://gateway.marvel.com/v1/public/characters/1009220?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
    end

    it '#urls - A set of public web site URLs for the resource.' do
      expect(character.urls.class).to eq Array
      expect(character.urls.first.type).to eq "detail"
      expect(character.urls.first.url).to eq "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7"
    end

    it '#thumbnail - The representative image for this character.' do
      expect(character.thumbnail.full_path).to eq "http://i.annihil.us/u/prod/marvel/i/mg/2/c0/5261a81d0154e.jpg"
      expect(character.thumbnail.class).to eq Marver::Image
    end

    context 'summary objects' do
      before :each do
        Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      end

      it '#comics - A resource list containing comics which feature this character.' do
        expect(character.comics.class).to eq Array
        expect(character.comics.first.class).to eq Marver::Summary::Comic
        expect(character.comics.first.name).to eq "Age of Apocalypse (2011) #2 (Avengers Art Appreciation Variant)"
        expect(character.comics.first.resource_uri).to eq          "http://gateway.marvel.com/v1/public/comics/42539?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
      end

      it '#stories - A resource list of stories in which this character appears.' do
        expect(character.stories.class).to eq Array
        expect(character.stories.first.class).to eq Marver::Summary::Story
        expect(character.stories.first.name).to eq "Cover #892"
        expect(character.stories.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/892?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
        expect(character.stories.first.type).to eq "cover"
      end

      it '#events - A resource list of events in which this character appears.' do
        expect(character.events.class).to eq Array
        expect(character.events.first.class).to eq Marver::Summary::Event
        expect(character.events.first.name).to eq "Acts of Vengeance!"
        expect(character.events.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/events/116?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
      end

      it '#series - A resource list of series in which this character appears.' do
        expect(character.series.class).to eq Array
        expect(character.series.first.class).to eq Marver::Summary::Serie
        expect(character.series.first.name).to eq "Age of Apocalypse (2011 - Present)"
        expect(character.series.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/15331?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
      end
    end

  end
end
