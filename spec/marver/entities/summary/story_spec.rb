require 'spec_helper'

describe Marver::Summary::Story do
  let(:story_summary) { Marver::Summary::Story.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" }) }

  it '#id' do
    expect(story_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(story_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(story_summary.type).to eq nil
  end

  it '#name' do
    expect(story_summary.name).to eq "Hulk"
  end

  describe '#full' do
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get(story_summary.resource_uri).to_return(:body => fixture('story.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_story = story_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_story.class).to eq Marver::Story
      expect(@full_story.title).to eq "Cover #892"
    end

    context 'summary objects' do
      it 'has list of comic summaries' do
        expect(@full_story.comics.class).to eq Array
        expect(@full_story.comics.first.class).to eq Marver::Summary::Comic
        expect(@full_story.comics.first.name).to eq "Thor (1998) #81"
      end

      it 'has a list of characters summaries' do
        expect(@full_story.characters.class).to eq Array
        expect(@full_story.characters.first.class).to eq Marver::Summary::Character
        expect(@full_story.characters.first.name).to eq "Avengers"
      end

      it 'has a list of series summaries' do
        expect(@full_story.series.class).to eq Array
        expect(@full_story.series.first.class).to eq Marver::Summary::Serie
        expect(@full_story.series.first.name).to eq "Thor (1998 - 2004)"
      end

      it 'has a list of events summaries' do
        expect(@full_story.events.class).to eq Array
        expect(@full_story.events.first.class).to eq Marver::Summary::Event
        expect(@full_story.events.first.name).to eq "Avengers Disassembled"
      end
    end
  end
end
