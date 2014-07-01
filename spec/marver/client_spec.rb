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

  it 'has a serie finder' do
    expect(@client.series.class).to eq Marver::SerieFinder
  end

  it 'has a comic finder' do
    expect(@client.comics.class).to eq Marver::ComicFinder
  end

  it 'has a story finder' do
    expect(@client.stories.class).to eq Marver::StoryFinder
  end
end
