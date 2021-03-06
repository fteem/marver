require 'spec_helper'

describe Marver::Factory::Summary::Event do
  let(:json) { fixture('character.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['events']['items']) }

  it 'builds an event summary out of api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Summary::Event
  end
end