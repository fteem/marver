require 'spec_helper'

describe Marver::Factory::Summary::Character do
  let(:json) { fixture('event.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['series']['items']) }

  it 'builds a character summary out of api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Summary::Character
  end
end