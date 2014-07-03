require 'spec_helper'
require 'json'

describe Marver::Serie do

  let(:json) { fixture('serie.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:serie) { Marver::Factory::Serie.new(results).build }

  it '#id - The unique ID of the series resource.' do
    expect(serie.id).to eq 2002
  end

  it '#description - A description of the series.' do
    expect(serie.description).to eq "Join the Man Without Fear as he stands up for justice! Blind lawyer Matt Murdock protects the streets of Hell's Kitchen by night against dangerous foes like Bullseye and the Kingpin! Includes the classic stories by icon Frank Miller that changed comics forever."
  end

  it '#urls - A set of public web site URLs for the resource.' do
    expect(serie.urls.class).to eq Array
    expect(serie.urls.first.url).to eq "http://marvel.com/comics/series/2002/daredevil_1963_-_1998?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7"
    expect(serie.urls.first.type).to eq "detail"
    expect(serie.urls.first.class).to eq Marver::Url
  end

  it '#start_year - The first year of publication for the series.' do
    expect(serie.start_year).to eq 1963
  end

  it '#end_year - The last year of publication for the series (conventionally, 2099 for ongoing series).' do
    expect(serie.end_year).to eq 1998
  end

  it '#rating - The age-appropriateness rating for the series.' do
    expect(serie.rating).to eq ""
  end

  it '#thumbnail - The representative image for this series.' do
    expect(serie.thumbnail.full_path).to eq "http://i.annihil.us/u/prod/marvel/i/mg/1/00/5130f628766d9.jpg"
    expect(serie.thumbnail.class).to eq Marver::Image
  end

  it '#comics - A resource list containing comics in this series.' do
    expect(serie.comics.class).to eq Array
    expect(serie.comics.first.class).to eq Marver::Summary::Comic
    expect(serie.comics.first.name).to eq "Daredevil (1963)"
    expect(serie.comics.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/comics/8072"
  end

  it '#stories - A resource list containing stories which occur in comics in this series.' do
    expect(serie.stories.class).to eq Array
    expect(serie.stories.first.class).to eq Marver::Summary::Story
    expect(serie.stories.first.name).to eq "Life Be Not Proud!"
    expect(serie.stories.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/stories/15722"
    expect(serie.stories.first.type).to eq "interiorStory"
  end

  it '#events - A resource list containing events which take place in comics in this series.' do
    expect(serie.events.class).to eq Array
    expect(serie.events.first.class).to eq Marver::Summary::Event
    expect(serie.events.first.name).to eq "Acts of Vengeance!"
    expect(serie.events.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/events/116"
  end

  it '#characters - A resource list containing characters which appear in comics in this series.' do
    expect(serie.characters.class).to eq Array
    expect(serie.characters.first.class).to eq Marver::Summary::Character
    expect(serie.characters.first.name).to eq "Beast"
    expect(serie.characters.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/characters/1009175"
  end

  it '#creators - A resource list of creators whose work appears in comics in this series.' do
    expect(serie.creators.class).to eq Array
    expect(serie.creators.first.class).to eq Marver::Summary::Creator
    expect(serie.creators.first.name).to eq "Mark Bagley"
    expect(serie.creators.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/creators/87"
    expect(serie.creators.first.role).to eq "penciller (cover)"
  end

  it '#next - A summary representation of the series which follows this series.' do
    expect(serie.next.class).to eq Marver::Summary::Serie
    expect(serie.next.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/449"
  end

  it '#previous - A summary representation of the series which preceded this series.' do
    expect(serie.previous.class).to eq Marver::Summary::Serie
    expect(serie.previous.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/449"
  end

  it "#title - Serie's title" do
    expect(serie.title).to eq "Daredevil (1963 - 1998)"
  end

  it "#resource_uri - Full cannonical URL of the entity" do
    expect(serie.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/2002"
  end

end
