require 'spec_helper'

describe Marver::StoryAttributesMapper do  
  let(:json) { fixture('story.json').read }
  let(:response) { Marver::API::Response.new(json) }
  let(:results) { Marver::DataContainer.new(response).results }
  let(:mapped_attributes) { described_class.new(results).map }

  it 'maps valid json attributes to a hash' do
    expect(mapped_attributes).to be_kind_of(Hash)
    expect(mapped_attributes[:title]).to eq "Cover #892"
    expect(mapped_attributes[:description]).to eq ""
    expect(mapped_attributes[:type]).to eq "cover"
  end 
end