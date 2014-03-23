require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Creator do

  let(:json) { fixture('creator.json').read }
  let(:response) { Marver::REST::Response.new(json) }
  let(:credentials) { Marver::Credentials.new('pub_key', 'priv_key') }
  let(:data_container) { Marver::DataContainer.new(response) }
  let(:creator) { Marver::Creator.new(data_container.results, credentials) }

  it '#id - The unique ID of the creator resource.' do
    expect(creator.id).to eq 648
  end

  it '#first_name - The first name of the creator.' do
    expect(creator.first_name).to eq "Simone"
  end

  it '#middle_name - The middle name of the creator.' do
    expect(creator.middle_name).to eq ""
  end

  it '#last_name - The last name of the creator.' do
    expect(creator.last_name).to eq "Bianchi"
  end

  it '#suffix - The suffix or honorific for the creator.' do
    expect(creator.suffix).to eq ''
  end

  it '#full_name - The full name of the creator (a space-separated concatenation of the above four fields).' do
    expect(creator.full_name).to eq "Simone Bianchi"
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    expect(creator.resource_uri).to eq "http://gateway.marvel.com/v1/public/creators/648"
  end

  it '#urls - A set of public web site URLs for the resource.' do
    expect(creator.urls.class).to eq Array
    expect(creator.urls.first.class).to eq Marver::Url
    expect(creator.urls.first.url).to eq "http://marvel.com/comics/creators/648/simone_bianchi?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7"
  end

  it '#thumbnail - The representative image for this creator.' do
    expect(creator.thumbnail.class).to eq Marver::Image
    expect(creator.thumbnail.full_path).to eq "http://i.annihil.us/u/prod/marvel/i/mg/f/30/4bc5a8bb82ff1.jpg"
  end

  it '#series - A resource list containing the series which feature work by this creator.' do
    Time.stub_chain(:now, :to_i, :to_s).and_return '1'
    expect(creator.series.class).to eq Array
    expect(creator.series.first.class).to eq Marver::SerieSummary
    expect(creator.series.first.name).to eq "Age of X: Universe (2011)"
    expect(creator.series.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/13896?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#comics - A resource list containing the stories which feature work by this creator' do
    Time.stub_chain(:now, :to_i, :to_s).and_return '1'
    expect(creator.comics.class).to eq Array
    expect(creator.comics.first.class).to eq Marver::ComicSummary
    expect(creator.comics.first.name).to eq "Age of X: Universe (2011) #1"
    expect(creator.comics.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/comics/38524?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#stories - A resource list containing the comics which feature work by this creator.' do
    Time.stub_chain(:now, :to_i, :to_s).and_return '1'
    expect(creator.stories.class).to eq Array
    expect(creator.stories.first.class).to eq Marver::StorySummary
    expect(creator.stories.first.name).to eq "1 of 6 - Evolution"
    expect(creator.stories.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/2243?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#events - A resource list containing the events which feature work by this creator.' do
    Time.stub_chain(:now, :to_i, :to_s).and_return '1'
    expect(creator.events.class).to eq Array
    expect(creator.events.first.class).to eq Marver::EventSummary
    expect(creator.events.first.name).to eq "Age of X"
    expect(creator.events.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/events/303?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end
end
