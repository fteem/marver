require_relative '../lib/marver.rb'

describe Marver do

  let(:marver) { Marver.new("prv123", "pub123") }

  it "has an public api key" do
    expect(marver.public_key).to eq "pub123"
  end

  it "has a private api key" do
    expect(marver.private_key).to eq "prv123"
  end

  describe "#characters" do
    before :each do
      RestClient.stub(:get).with(anything).and_return @json = double
    end

    it "is success" do
      RestClient.should_receive(:get)
      expect(marver.characters).to eq @json
    end

    context "no character name as param" do
    end

    context "no character name as param" do
    end
  end

end
