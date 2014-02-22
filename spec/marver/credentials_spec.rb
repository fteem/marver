require './lib/marver.rb'

describe Marver::Credentials do
  let(:credentials) { Marver::Credentials.new("pub_key", "priv_key") }

  it "has a API private key" do
    expect(credentials.public_key).to eq "pub_key"
  end

  it "has a API public key" do
    expect(credentials.private_key).to eq "priv_key"
  end

  it 'has a timestamp' do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    expect(credentials.timestamp).to eq "1"
  end

end
