require './lib/marver.rb'

describe Marver::API::Credentials do
  before :each do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"

    Marver.configure do |config|
      config.public_key  = 'pub_key'
      config.private_key = 'priv_key'
    end

  end

  it "returns api credentials as hash" do
    expect(Marver::API::Credentials.get).to eq({ ts: "1", apikey: "pub_key", hash: "3d4ce88a477c7e4a5accbf6cd2c8b819" })
  end
end
