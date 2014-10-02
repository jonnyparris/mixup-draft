require_relative "./spec_helper"

describe Stem do
  describe "attributes" do
    it { should respond_to(:track_name) }
    it { should respond_to(:download_url) }
    it { should respond_to(:producer) }    
  end

  describe "associations" do
    it { should belong_to(:producer) }
    it { should have_many(:remix) }
    it { should have_many(:circle).through(:remix) }
  end

  describe "validations" do    
    it "is valid with a track_name, download_url, and producer" do
      Producer.delete_all
      Producer.create(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta', password_confirmation: 'boselecta')
      valid_stem = Stem.new(track_name: 'Peanut Butter Jammin',download_url: "http://www.reddit.com/r/IsolatedVocals/top/", producer: Producer.first)
      expect(valid_stem).to be_valid
    end

    it "is invalid without a track_name" do
      expect(Stem.new(track_name: nil)).to have(1).errors_on(:track_name)
    end

    it "is invalid without an download_url" do
      expect(Stem.new(download_url: nil)).to have(1).errors_on(:download_url)    
    end

    it "is invalid without a producer" do
      expect(Stem.new(producer: nil)).to have(1).errors_on(:producer)
    end

    #trying out the shoulda-matcher gem
    subject { Stem.new(download_url: 'www.phatriddim.com') }
    it { should validate_uniqueness_of(:download_url) }

    it { should validate_presence_of(:track_name) }
  end
end