require 'spec_helper'

describe Marver::SerieAttributesMapper do
  let(:json) { fixture('serie.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:title]).to eq "Daredevil (1963 - 1998)"
    expect(mapped_attributes[:start_year]).to eq 1963
    expect(mapped_attributes[:end_year]).to eq 1998
    expect(mapped_attributes[:rating]).to eq ""
    expect(mapped_attributes[:type]).to eq "ongoing"
  end 
end