require 'spec_helper'

describe Marver::ComicAttributesMapper do
  let(:json) { fixture('comic.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:format]).to eq "Comic"
  end 

  it 'rejects invalid json attributes' do
    expect(mapped_attributes[:some_invalid_attribute]).to be_nil
  end
end