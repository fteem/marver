require 'spec_helper'

describe Marver::Factory::Summary::Serie do
  let(:json) { fixture('character.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['series']['items']) }

  it 'builds a serie summary out of api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Summary::Serie
  end
end