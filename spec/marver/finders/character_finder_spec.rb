require './lib/marver/finders/character_finder.rb'

describe Marver::CharacterFinder do
  let(:credentials) { double(Marver::Credentials, class: Marver::Credentials) }
  let(:finder) { Marver::CharacterFinder.new(credentials) }

  it 'has credentials' do
    expect(finder.credentials.class).to eq Marver::Credentials
  end

  it 'has a rest client' do
    expect(finder.rest_client.class).to eq Marver::REST::Client
  end

  describe '#find' do
    context 'no arguments' do
      it 'returns a list of characters' do
      end
    end

    context 'with arguments' do
      it 'returns a character' do
        pending
      end
    end
  end
end
