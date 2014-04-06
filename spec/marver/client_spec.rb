require 'spec_helper'

describe Marver::Client do
  let(:client) { Marver::Client.new("private_key", "public_key") }

  it 'has a character finder' do
    expect(client.characters.class).to eq Marver::CharacterFinder
  end

end
