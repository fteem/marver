require 'spec_helper'

describe Marver::StringHelper do 
  it 'can parameterize strings' do
    expect(described_class.parameterize("camelCasedString")).to eq 'camel_cased_string'
  end
end