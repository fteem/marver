require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Event do

  let(:event) { Marver::Event.new({ "resourceURI" => "http://gateway.marvel.com/v1/public/events/116",
              "name" => "Acts of Vengeance!"}) }

  it "#name - The title of the event." do
    expect(event.name).to eq "Acts of Vengeance!"
  end

  it "#resourceURI - The canonical URL identifier for this resource." do
    expect(event.resource_uri).to eq "http://gateway.marvel.com/v1/public/events/116"
  end
end
