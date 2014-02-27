require './lib/marver.rb'

describe Marver::CreatorSummary do
  before :each do
    Time.stub_chain(:now, :to_i, :to_s).and_return "1"
    credentials = Marver::Credentials.new('priv_key', 'pub_key')
    @creator = Marver::CreatorSummary.new({
                "resourceURI" => "http://gateway.marvel.com/v1/public/creators/648", "name" => "Simone Bianchi", "role" => "penciller (cover)"
              }, credentials)
  end

  it "#name - creator's name" do
    expect(@creator.name).to eq "Simone Bianchi"
  end

  it '#resource_uri - The canonical URL identifier for this resource.' do
    expect(@creator.resource_uri).to eq "http://gateway.marvel.com/v1/public/creators/648?ts=1&apikey=priv_key&hash=668dea517c974c12d8d0193cf2d8f7f7"
  end

  it '#role - the role this creator took' do
    expect(@creator.role).to eq "penciller (cover)"
  end
end
