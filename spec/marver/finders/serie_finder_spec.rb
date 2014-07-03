require 'spec_helper'

describe Marver::SerieFinder do
  let(:finder) { described_class.new }

  describe '#find' do 
    before :each do
      Time.stub_chain(:now, :to_i, :to_s).and_return "1"
      stub_get("http://gateway.marvel.com/v1/public/series?apikey=pub_key&hash=3d4ce88a477c7e4a5accbf6cd2c8b819&name=The%20Avengers&ts=1").to_return(:body => fixture('serie.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

      Marver.configure do |config|
        config.public_key = 'pub_key'
        config.private_key = 'priv_key'
      end
    end

    it 'builds a Serie out of the received json' do
      expect(finder.find_by_name('The Avengers')).to be_kind_of(Marver::Serie)
    end

    Marver::SerieFinder::ALLOWED_PARAMS.each do |param|
      parameterized_param = Marver::StringHelper.parameterize(param.to_s)
      it 'should respond to #{parameterized_param}' do
        expect(finder).to respond_to("find_by_#{parameterized_param}".to_sym)
      end
    end
  end
end