require_relative "./spec_helper"

describe Stem do
  describe "attributes" do
    it { should respond_to(:track_name) }
    it { should respond_to(:download_url) }
    it { should respond_to(:owner_id) }    
  end

  describe "associations" do
    it { should belong_to(:producer).with_foreign_key('owner_id') }
    it { should have_many(:remix) }
    it { should have_many(:circle).through(:remix) }
  end

  describe "validations" do    
    it "is valid with a track_name, download_url, and owner_id" do
      valid_stem = Stem.new(track_name: 'Peanut Butter Jammin',download_url: "http://www.reddit.com/r/IsolatedVocals/top/", owner_id: 1)
      expect(valid_stem).to be_valid
    end

    it "is invalid without a track_name" do
      expect(Stem.new(track_name: nil)).to have(1).errors_on(:track_name)
    end

    it "is invalid without an download_url" do
      expect(Stem.new(download_url: nil)).to have(1).errors_on(:download_url)    
    end

    it "is invalid without a owner_id" do
      expect(Stem.new(owner_id: nil)).to have(1).errors_on(:owner_id)
    end

    #trying out the shoulda-matcher gem
    subject { Stem.new(download_url: 'www.phatriddim.com') }
    it { should validate_uniqueness_of(:download_url) }

    it { should validate_presence_of(:track_name) }
  end
end