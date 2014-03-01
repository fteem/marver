require 'spec_helper'
require './lib/marver.rb'

describe Marver::CharacterSummary do
  let(:json) { JSON.parse("{ \"id\": \"123\", \"resourceURI\": \"http://gateway.marvel.com/v1/public/characters/1009351\", \"name\": \"Hulk\" }") }
  let(:credentials) { Marver::Credentials.new('priv_key', 'pub_key') }
  let(:character_summary) { Marver::CharacterSummary.new(json,
                                                         credentials) }

  it '#id' do
    expect(character_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(character_summary.resource_uri).to eq "http://gateway.marvel.com/v1/public/characters/1009351?ts=1&apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819"
  end

  it '#type should always be nil' do
    expect(character_summary.type).to eq nil
  end

  it '#name' do
    expect(character_summary.name).to eq "Hulk"
  end

  describe '#full' do
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get(character_summary.resource_uri).to_return(:body => fixture('character.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_character = character_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_character.class).to eq Marver::Character
      expect(@full_character.name).to eq "Captain America"
    end

    context 'summary objects' do
      it 'has list of comic summaries' do
        expect(@full_character.comics.class).to eq Array
        expect(@full_character.comics.first.class).to eq Marver::ComicSummary
        expect(@full_character.comics.first.name).to eq "Age of Apocalypse (2011) #2 (Avengers Art Appreciation Variant)"
      end

      it 'has a list of stories summaries' do
        expect(@full_character.stories.class).to eq Array
        expect(@full_character.stories.first.class).to eq Marver::StorySummary
        expect(@full_character.stories.first.name).to eq "Cover #892"
      end

      it 'has a list of events summaries' do
        expect(@full_character.events.class).to eq Array
        expect(@full_character.events.first.class).to eq Marver::EventSummary
        expect(@full_character.events.first.name).to eq "Acts of Vengeance!"
      end

      it 'has a list of series summaries' do
        expect(@full_character.series.class).to eq Array
        expect(@full_character.series.first.class).to eq Marver::SerieSummary
        expect(@full_character.series.first.name).to eq "Age of Apocalypse (2011 - Present)"
      end
    end
  end
end
