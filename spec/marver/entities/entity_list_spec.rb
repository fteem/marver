require './lib/marver.rb'

describe Marver::EntityList do
  let(:items) { { "items" => [
            {
              "resourceURI" => "http://gateway.marvel.com/v1/public/comics/41112",
              "name" => "5 Ronin (Hardcover)"
            }
  ] } }

  let(:list) { Marver::EntityList.new({ "available" => '20',
                                        "returned" => '5',
                                        "collectionURI" => 'http://example.net',
                                        'items' => items })}

  it '#available - The number of total available resources in this list' do
    expect(list.available).to eq 20
  end

  it '#returned - The number of resources returned in this resource list (up to 20).' do
    expect(list.returned).to eq 5
  end

  it '#collection_uri - The path to the list of full view representations of the items in this resource list.' do
    expect(list.collection_uri).to eq 'http://example.net'
  end

  it '#items - A list of summary views of the items in this resource list.' do
    expect(list.items.class).to eq Array
    expect(list.items.first.class).to eq Marver::ComicSummary
    expect(list.items.first.resource_uri).to eq "http://gateway.marvel.com/v1/public/comics/41112"
    expect(list.items.first.name).to eq "5 Ronin (Hardcover)"
  end
end
