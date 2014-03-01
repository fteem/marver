require 'spec_helper'
require 'json'
require './lib/marver.rb'

describe Marver::Event do

  let(:credentials) { Marver::Credentials.new("pub_key", "priv_key") }
  let(:event) { Marver::Event.new({ "resourceURI" => "http://gateway.marvel.com/v1/public/events/116", "name" => "Acts of Vengeance!"}, credentials) }

  it "#name - The title of the event." do
    expect(event.name).to eq "Acts of Vengeance!"
  end

  it "#resourceURI - The canonical URL identifier for this resource." do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(event.resource_uri).to eq "http://gateway.marvel.com/v1/public/events/116?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end
end
