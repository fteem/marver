require 'spec_helper'

describe Marver::Configuration do
  before :each do
    Marver.configure do |config|
      config.private_key = 'priv123'
      config.public_key  = 'pub123'
    end
  end

  it 'has a private key' do
    expect(Marver.configuration.private_key).to eq 'priv123'
  end

  it 'has a public key' do
    expect(Marver.configuration.public_key).to eq 'pub123'
  end
end
