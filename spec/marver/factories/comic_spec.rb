require 'spec_helper'

describe Marver::Factory::Comic do
  let(:json) { fixture('comic.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a comic out of api results' do
    expect(factory.build).to be_kind_of Marver::Comic
  end
end