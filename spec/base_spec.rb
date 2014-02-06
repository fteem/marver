require_relative '../lib/base'

describe Marver::Base do

  let(:marver) { Marver::Base.new("prv123", "pub123") }

  it "has an public api key" do
    expect(marver.public_key).to eq "pub123"
  end

  it "has a private api key" do
    expect(marver.private_key).to eq "prv123"
  end

  describe "#characters" do
    context "no character name as param" do
      before :each do
        json = "{\"data\" : { \"results\" : [{\"name\" : \"Hulk\", \"description\" : \"Lorem ipsum\",
                \"thumbnail\" : {\"path\" : \"some_path\", \"extension\" : \"png\"},
                \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} },
                {\"name\" : \"Captain America\", \"description\" : \"Lorem ipsum\",
                \"thumbnail\" : {\"path\" : \"cpt_america\", \"extension\" : \"png\"},
                \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} }]
                }}"
        RestClient.stub(:get).with(anything).and_return json
      end

      it 'builds a list of characters' do
        heros = marver.characters

        expect(heros.first.name).to eq "Hulk"
        expect(heros.first.description).to eq "Lorem ipsum"
        expect(heros.first.thumbnail).to eq "some_path.png"
        expect(heros.first.comics.first.name).to eq "Avengers"

        expect(heros.last.name).to eq "Captain America"
        expect(heros.last.description).to eq "Lorem ipsum"
        expect(heros.last.thumbnail).to eq "cpt_america.png"
        expect(heros.last.comics.first.name).to eq "Avengers"
      end
    end

    context "character name as param" do
      before :each do
        json = "{\"data\" : { \"results\" : [{\"name\" : \"Hulk\", \"description\" : \"Lorem ipsum\",
                  \"thumbnail\" : {\"path\" : \"some_path\", \"extension\" : \"png\"},
                  \"comics\" : { \"items\" : [{ \"name\" : \"Avengers\"}]} }]}}"
        RestClient.stub(:get).with(anything).and_return json
      end

      it "builds a character object" do
        hulk = marver.characters('hulk')
        expect(hulk.name).to eq "Hulk"
        expect(hulk.description).to eq "Lorem ipsum"
        expect(hulk.thumbnail).to eq "some_path.png"
        expect(hulk.comics.first.name).to eq "Avengers"
      end
    end
  end

end
