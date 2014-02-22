require 'spec_helper.rb'
require './lib/marver/rest/client.rb'

describe Marver::REST::Client do
  let(:client) { Marver::REST::Client.new }

  it '#endpoint' do
    expect(client.endpoint).to eq "http://gateway.marvel.com/v1/public/"
  end
end
