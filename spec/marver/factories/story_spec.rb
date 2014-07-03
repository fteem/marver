require 'spec_helper'

describe Marver::Factory::Story do
  let(:json) { fixture('story.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results) }

  it 'builds a story out of api results' do
    expect(factory.build).to be_kind_of Marver::Story
  end
end