require 'spec_helper'
require './lib/marver/rest/client.rb'
require './lib/marver.rb'

describe Marver::Client do
  describe '#characters' do

    before :each do
      stub_get("characters").to_return(:body => fixture('raw_json.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
      @marver_client = Marver::Client.new('private_key', 'public_key')
    end

    it 'returns an API response' do
      response = @marver_client.characters
      expect(response.class).to eq Marver::REST::Response
    end
  end
end
