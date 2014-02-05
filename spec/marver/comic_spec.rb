require_relative '../../lib/marver/comic.rb'

describe Marver::Comic do
  let(:comic) { Marver::Comic.new({ 'name' => 'Avengers' }) }

  it 'has a name' do
    expect(comic.name).to eq 'Avengers'
  end
end
