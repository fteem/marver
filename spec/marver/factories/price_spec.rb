require 'spec_helper'

describe Marver::Factory::Price do
  let(:json) { fixture('comic.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['prices']) }

  it 'builds a list of prices from api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Price
  end
end