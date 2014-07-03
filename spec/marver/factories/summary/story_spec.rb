require 'spec_helper'

describe Marver::Factory::Summary::Story do
  let(:json) { fixture('event.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['stories']['items']) }

  it 'builds a story summary out of api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Summary::Story
  end
end