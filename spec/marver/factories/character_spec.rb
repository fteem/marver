require 'spec_helper'

describe Marver::Factory::Character do
  let(:json) { fixture('character.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a character out of api results' do
    expect(factory.build).to be_kind_of Marver::Character
  end
end