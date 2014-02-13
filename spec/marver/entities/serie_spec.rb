require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Serie do

  let(:serie) { Marver::Serie.new({
        "resourceURI" => "http://gateway.marvel.com/v1/public/series/12429",
        "name" => "5 Ronin (2010)" }) }

  it "#name - Serie's title" do
    expect(serie.name).to eq "5 Ronin (2010)"
  end

  it "#resource_uri - Full cannonical URL of the entity" do
    expect(serie.resource_uri).to eq "http://gateway.marvel.com/v1/public/series/12429"
  end
end
