require 'spec_helper'
require './lib/marver/entities/summaries/character_summary'
require './lib/marver/credentials'
require './lib/marver/entities/core/character'

describe Marver::CharacterSummary do
  let(:credentials) { Marver::Credentials.new('priv_key', 'pub_key') }
  let(:character_summary) { Marver::CharacterSummary.new({ "id" => "123", "resourceURI" => "http://gateway.marvel.com/v1/public/characters/1009351", "name" => "Hulk" },
                                                         credentials) }

  it '#id' do
    expect(character_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(character_summary.resource_uri).to eq "http://gateway.marvel.com/v1/public/characters/1009351?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
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
      stub_get("http://gateway.marvel.com/v1/public/characters/1009351?apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7&ts=1").to_return(:body => fixture('raw_json.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_character = character_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_character.class).to eq Marver::Character
      expect(@full_character.name).to eq "Hulk"
    end

    context 'summary objects' do
      it 'has list of comic summaries' do
        expect(@full_character.comics.class).to eq Array
        expect(@full_character.comics.first.class).to eq Marver::ComicSummary
        expect(@full_character.comics.first.title).to eq "Avengers"
      end

      it 'has a list of stories summaries' do
        expect(@full_character.stories.class).to eq Array
        expect(@full_character.stories.first.class).to eq Marver::StorySummary
        expect(@full_character.stories.first.name).to eq "Interior #703"
      end

      it 'has a list of events summaries' do
        expect(@full_character.events.class).to eq Array
        expect(@full_character.events.first.class).to eq Marver::EventSummary
        expect(@full_character.events.first.name).to eq "Acts of Vengeance!"
      end

      it 'has a list of series summaries' do
        expect(@full_character.series.class).to eq Array
        expect(@full_character.series.first.class).to eq Marver::SerieSummary
        expect(@full_character.series.first.name).to eq "5 Ronin (2011)"
      end
    end
  end
end
