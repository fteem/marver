require 'spec_helper'

describe Marver::CharacterAttributesMapper do
  let(:json) { fixture('character.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }

  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:name]).to eq "Captain America"
  end 
end