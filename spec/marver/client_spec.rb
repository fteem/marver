require 'spec_helper'

describe Marver::Client do
  before :each do
    Marver.configure do |config|
      config.public_key = 'pub-key'
      config.private_key = 'priv-key'
    end

    @client = Marver::Client.new
  end

  it 'has a character finder' do
    expect(@client.characters.class).to eq Marver::CharacterFinder
  end

end
