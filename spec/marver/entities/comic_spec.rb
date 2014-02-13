require './lib/marver/entities/comic.rb'

describe Marver::Comic do
  let(:comic) { Marver::Comic.new({ 'id' => '12345', 'name' => 'Avengers', "resourceURI" => "http://example.net/" }) }

  it '#id - The unique ID of the character resource' do
    expect(comic.id).to eq '12345'
  end

  it '#name - The name of the character.' do
    expect(comic.name).to eq 'Avengers'
  end

  it '#resourceURI - The canonical URL identifier for this resource.' do
    expect(comic.resource_uri).to eq "http://example.net/"
    end
end
