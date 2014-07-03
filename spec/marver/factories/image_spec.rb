require 'spec_helper'

describe Marver::Factory::Image do
  let(:json) { fixture('comic.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:factory) { described_class.new(results['images']) }

  it 'builds a list of images from api results' do
    expect(factory.build).to be_kind_of Array
    expect(factory.build.first).to be_kind_of Marver::Image
  end
end