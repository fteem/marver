require_relative '../../lib/base.rb'

describe Marver::Character do
  let(:comic_json) { { "name" => "Avengers" } }
  let(:character) { Marver::Character.new({ "name" => "Hulk", "description" => "Lorem ipsum",
                              "thumbnail" => { "path" => "some_image", "extension" => "png"},
                              "comics" => { "items" => [ comic_json ]}})}
  it 'has a name' do
    expect(character.name).to eq "Hulk"
  end

  it 'has a description' do
    expect(character.description).to eq "Lorem ipsum"
  end

  it 'has a thumbnail' do
    expect(character.thumbnail).to eq "some_image.png"
  end

  it 'has a list of comics' do
    Marver::Comic.stub(:new).and_return comic = double
    expect(character.comics).to eq [comic]
  end
end
