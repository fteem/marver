require 'spec_helper'

describe Marver::Summary::Creator do
  before :each do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    @creator_summary = Marver::Summary::Creator.new({
                "resourceURI" => "http://gateway.marvel.com/v1/public/creators/648", "name" => "Simone Bianchi", "role" => "penciller (cover)"
              })
  end

  it "#name - creator's name" do
    expect(@creator_summary.name).to eq "Simone Bianchi"
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    expect(@creator_summary.resource_uri).to eq "http://gateway.marvel.com/v1/public/creators/648"
  end

  it '#role - the role this creator took' do
    expect(@creator_summary.role).to eq "penciller (cover)"
  end

  describe '#full' do
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get(@creator_summary.resource_uri).to_return(:body => fixture('creator.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @full_creator = @creator_summary.full
    end

    it 'fetches the full view of the entity' do
      expect(@full_creator.class).to eq Marver::Creator
      expect(@full_creator.first_name).to eq "Simone"
      expect(@full_creator.last_name).to eq "Bianchi"
      expect(@full_creator.full_name).to eq "Simone Bianchi"
    end

    context 'summary objects' do
      it 'has list of comic summaries' do
        expect(@full_creator.comics.class).to eq Array
        expect(@full_creator.comics.first.class).to eq Marver::Summary::Comic
        expect(@full_creator.comics.first.name).to eq "Age of X: Universe (2011) #1"
      end

      it 'has a list of stories summaries' do
        expect(@full_creator.stories.class).to eq Array
        expect(@full_creator.stories.first.class).to eq Marver::Summary::Story
        expect(@full_creator.stories.first.name).to eq "1 of 6 - Evolution"
      end

      it 'has a list of series summaries' do
        expect(@full_creator.series.class).to eq Array
        expect(@full_creator.series.first.class).to eq Marver::Summary::Serie
        expect(@full_creator.series.first.name).to eq "Age of X: Universe (2011)"
      end

      it 'has a list of events summaries' do
        expect(@full_creator.events.class).to eq Array
        expect(@full_creator.events.first.class).to eq Marver::Summary::Event
        expect(@full_creator.events.first.name).to eq "Age of X"
      end
    end
  end
end
