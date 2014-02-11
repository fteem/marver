require_relative '../../lib/marver.rb'

describe Marver::Character do
  let(:comic_json) { { "name" => "Avengers" } }
  let(:character) { Marver::Character.new({ "id" => "12345", "name" => "Hulk", "description" => "Lorem ipsum",
                              "thumbnail" => { "path" => "some_image", "extension" => "png"},
                              "comics" => { "items" => [ comic_json ]}})}
  it 'has an id' do
    expect(character.id).to eq "12345"
  end

  it 'has a name' do
    expect(character.name).to eq "Hulk"
  end

  it 'has a description' do
    expect(character.description).to eq "Lorem ipsum"
  end

  it 'has a thumbnail' do
    expect(character.thumbnail).to eq "some_image.png"
  end

  describe "#comics" do
    it 'has a list of comics' do
      expect(character.comics.first).to eq "Avengers"
    end
  end

end
