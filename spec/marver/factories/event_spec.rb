require 'spec_helper'

describe Marver::Factory::Event do
  let(:json) { fixture('event.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds an event out of api results' do
    expect(factory.build).to be_kind_of Marver::Event
  end
end