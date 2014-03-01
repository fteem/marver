require 'spec_helper'
require './lib/marver.rb'

describe Marver::Url do
  let(:json) { { "type" => "wiki", "url" => "http://marvel.com/universe/Hulk_(Bruce_Banner)?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7" } }
  let(:url) { Marver::Url.new(json) }


  it '#type - description' do
    expect(url.type).to eq "wiki"
  end

  it '#url - raw url' do
    expect(url.url).to eq "http://marvel.com/universe/Hulk_(Bruce_Banner)?utm_campaign=apiRef&utm_source=f302f582215c3deedff86e8015f853c7"
  end
end
