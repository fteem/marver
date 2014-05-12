require 'spec_helper'

describe Marver::Summary::Event do
  let(:event_summary) { Marver::Summary::Event.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Breathing" }) }

  it '#id' do
    expect(event_summary.id).to eq 123
  end

  it '#resource_uri' do
    expect(event_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(event_summary.type).to eq nil
  end

  it '#name' do
    expect(event_summary.name).to eq "Breathing"
  end

  describe '#full' do
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get(event_summary.resource_uri).to_return(:body => fixture('event.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_event = event_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_event.class).to eq Marver::Event
      expect(@full_event.title).to eq "Fall of the Mutants"
    end

    context 'summary objects' do
      it 'has list of comic summaries' do
        expect(@full_event.comics.class).to eq Array
        expect(@full_event.comics.first.class).to eq Marver::Summary::Comic
        expect(@full_event.comics.first.name).to eq "Captain America (1968) #339"
      end

      it 'has a list of stories summaries' do
        expect(@full_event.stories.class).to eq Array
        expect(@full_event.stories.first.class).to eq Marver::Summary::Story
        expect(@full_event.stories.first.name).to eq "Fall of the Mutants"
      end

      it 'has a list of series summaries' do
        expect(@full_event.series.class).to eq Array
        expect(@full_event.series.first.class).to eq Marver::Summary::Serie
        expect(@full_event.series.first.name).to eq "Daredevil (1963 - 1998)"
      end

      it 'has a list of characters summaries' do
        expect(@full_event.characters.class).to eq Array
        expect(@full_event.characters.first.class).to eq Marver::Summary::Character
        expect(@full_event.characters.first.name).to eq "Havok"
      end
    end
  end
end
