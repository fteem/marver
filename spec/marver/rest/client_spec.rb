require 'spec_helper.rb'
require './lib/marver/rest/client.rb'

describe Marver::REST::Client do
  let(:client) { Marver::REST::Client.new('private_key', 'public_key') }

  it 'pulls json from api' do
    stub_get("characters").to_return(:body => fixture('raw_json.json'), :headers => {:content_type => 'application/json; charset=utf-8'})

    expect(client.call("characters").class).to eq Marver::REST::Response
  end
end
