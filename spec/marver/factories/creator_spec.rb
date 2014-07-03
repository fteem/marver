require 'spec_helper'

describe Marver::Factory::Creator do
  let(:json) { fixture('creator.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a creator out of api results' do
    expect(factory.build).to be_kind_of Marver::Creator
  end
end