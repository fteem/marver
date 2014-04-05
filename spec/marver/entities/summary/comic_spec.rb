require 'spec_helper'

describe Marver::Summary::Comic do
  let(:credentials) { Marver::Credentials.new('pub_key', 'priv_key') }
  let(:comic_summary) { Marver::Summary::Comic.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" }, credentials) }

  it '#id' do
    expect(comic_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(comic_summary.resource_uri).to eq "http://example.net?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#type should always be nil' do
    expect(comic_summary.type).to eq nil
  end

  it '#name' do
    expect(comic_summary.name).to eq "Hulk"
  end

  describe '#full' do
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get(comic_summary.resource_uri).to_return(:body => fixture('comic.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_comic = comic_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_comic.class).to eq Marver::Comic
      expect(@full_comic.title).to eq "Age of X: Universe (2011) #1"
    end

    context 'summary objects' do
      it 'has list of character summaries' do
        expect(@full_comic.characters.class).to eq Array
        expect(@full_comic.characters.first.class).to eq Marver::Summary::Character
        expect(@full_comic.characters.first.name).to eq "Captain America"
      end

      it 'has a list of stories summaries' do
        expect(@full_comic.stories.class).to eq Array
        expect(@full_comic.stories.first.class).to eq Marver::Summary::Story
        expect(@full_comic.stories.first.name).to eq "Age of X: Avengers (2011) #1"
      end

      it 'has a list of events summaries' do
        expect(@full_comic.events.class).to eq Array
        expect(@full_comic.events.first.class).to eq Marver::Summary::Event
        expect(@full_comic.events.first.name).to eq "Age of X"
      end

      it 'has a list of series summaries' do
        expect(@full_comic.series.class).to eq Array
        expect(@full_comic.series.first.class).to eq Marver::Summary::Serie
        expect(@full_comic.series.first.name).to eq "Age of X: Universe (2011)"
      end
    end
  end
end
