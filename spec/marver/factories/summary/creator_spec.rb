require 'spec_helper'

describe Marver::Factory::Summary::Creator do
  let(:json) { fixture('comic.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['creators']['items']) }

  it 'builds a creator summary out of api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Summary::Creator
  end
end