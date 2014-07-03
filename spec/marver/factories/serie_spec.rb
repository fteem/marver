require 'spec_helper'

describe Marver::Factory::Serie do
  let(:json) { fixture('serie.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a serie out of api results' do
    expect(factory.build).to be_kind_of Marver::Serie
  end
end