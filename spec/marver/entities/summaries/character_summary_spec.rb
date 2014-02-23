require './lib/marver/entities/summaries/character_summary'
require './lib/marver/credentials'

describe Marver::CharacterSummary do
  let(:credentials) { Marver::Credentials.new('priv_key', 'pub_key') }
  let(:character_summary) { Marver::CharacterSummary.new({ "id" => "123", "resourceURI" => "http://example.net", "name" => "Hulk" },
                                                         credentials) }

  it '#id' do
    expect(character_summary.id).to eq 123
  end

  it '#resource_uri' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(character_summary.resource_uri).to eq "http://example.net?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#type should always be nil' do
    expect(character_summary.type).to eq nil
  end

  it '#name' do
    expect(character_summary.name).to eq "Hulk"
  end

  describe '#full' do
    it 'fetches the full view of the entity' do


    end
  end
end
