require_relative '../../lib/marver/comic.rb'

describe Marver::Comic do
  let(:comic) { Marver::Comic.new({ 'id' => '12345', 'name' => 'Avengers' }) }

  it 'has an id' do
    expect(comic.id).to eq '12345'
  end

  it 'has a name' do
    expect(comic.name).to eq 'Avengers'
  end
end
