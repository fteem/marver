require 'spec_helper'

describe Marver::CharacterFinder do
  let(:finder) { Marver::CharacterFinder.new }

  before :each do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    stub_get("http://gateway.marvel.com/v1/public/characters?apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819&name=Hulk&ts=1").to_return(:body => fixture('character.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    Marver.configure do |config|
      config.public_key = 'pub_key'
      config.private_key = 'priv_key'
    end
  end

  it 'builds a Comic out of the received json' do
    expect(finder.find_by_name('Hulk')).to be_kind_of(Marver::Character)
  end

  Marver::CharacterFinder::ALLOWED_PARAMS.each do |param|
    parameterized_param = Marver::StringHelper.parameterize(param.to_s)
    it 'should respond to #{parameterized_param}' do
      expect(finder).to respond_to("find_by_#{parameterized_param}".to_sym)
    end
  end
end
