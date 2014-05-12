require 'spec_helper'

describe Marver::Summary::Serie do
  let(:series_summary) { Marver::Summary::Serie.new({ "resourceURI" => "http://example.net", "name" => "Hulk" }) }

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(series_summary.resource_uri).to eq "http://example.net"
  end

  it '#type should always be nil' do
    expect(series_summary.type).to eq nil
  end

  it '#name' do
    expect(series_summary.name).to eq "Hulk"
  end

  describe '#full' do
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get(series_summary.resource_uri).to_return(:body => fixture('serie.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_serie = series_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_serie.class).to eq Marver::Serie
      expect(@full_serie.title).to eq "Daredevil (1963 - 1998)"
    end

    context 'summary objects' do
      it 'has list of comic summaries' do
        expect(@full_serie.comics.class).to eq Array
        expect(@full_serie.comics.first.class).to eq Marver::Summary::Comic
        expect(@full_serie.comics.first.name).to eq "Daredevil (1963)"
      end

      it 'has a list of stories summaries' do
        expect(@full_serie.stories.class).to eq Array
        expect(@full_serie.stories.first.class).to eq Marver::Summary::Story
        expect(@full_serie.stories.first.name).to eq "Life Be Not Proud!"
      end

      it 'has a list of events summaries' do
        expect(@full_serie.events.class).to eq Array
        expect(@full_serie.events.first.class).to eq Marver::Summary::Event
        expect(@full_serie.events.first.name).to eq "Acts of Vengeance!"
      end

      it 'has a list of characters summaries' do
        expect(@full_serie.characters.class).to eq Array
        expect(@full_serie.characters.first.class).to eq Marver::Summary::Character
        expect(@full_serie.characters.first.name).to eq "Beast"
      end
    end
  end
end
