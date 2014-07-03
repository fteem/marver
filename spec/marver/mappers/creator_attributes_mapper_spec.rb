require 'spec_helper'

describe Marver::CreatorAttributesMapper do
  let(:json) { fixture('creator.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:first_name]).to eq "Simone"
    expect(mapped_attributes[:middle_name]).to eq ""
    expect(mapped_attributes[:last_name]).to eq "Bianchi"
  end 
end