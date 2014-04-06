require 'spec_helper.rb'

describe Marver::API::Client do
  let(:client) { Marver::API::Client.new }

  it '#endpoint' do
    expect(client.endpoint).to eq "http://gateway.marvel.com/v1/public/"
  end
end
