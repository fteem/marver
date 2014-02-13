require 'spec_helper'
require './lib/marver.rb'

describe Marver::Url do
  let(:json) { JSON.parse(fixture('character.json').read) }
  let(:url) { Marver::Url.new(json['urls'].first) }

  it '#type - description' do
    expect(url.type).to eq "detail"
  end

  it '#url - raw url' do
    expect(url.url).to eq "http://marvel.com/comics/characters/1009351/hulk?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7"
  end
end
