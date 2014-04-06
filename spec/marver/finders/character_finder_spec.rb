require './lib/marver/finders/character_finder.rb'

describe Marver::CharacterFinder do
  let(:finder) { Marver::CharacterFinder.new }

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
