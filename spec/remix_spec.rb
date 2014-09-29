require_relative "./spec_helper"

describe Remix do
  describe "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:download_url) }
    it { should respond_to(:circle_id) }
    it { should respond_to(:stem_id) }    
    it { should respond_to(:remixer_id) }    
  end

  describe "associations" do
    it { should belong_to(:producer).with_foreign_key('remixer_id') }
    it { should belong_to(:stem).with_foreign_key('stem_id') }
    it { should belong_to(:circle).with_foreign_key('circle_id') }
  end

  describe "validations" do    
    it "is valid with a circle_id and stem_id" do
      valid_stem = Remix.new(circle_id: 1, stem_id: 1)
      expect(valid_stem).to be_valid
    end

    it "is invalid without a circle_id" do
      expect(Remix.new(circle_id: nil)).to have(1).errors_on(:circle_id)
    end

    it "is invalid without an stem_id" do
      expect(Remix.new(stem_id: nil)).to have(1).errors_on(:stem_id)    
    end

    #trying out the shoulda-matcher gem
    subject { Remix.new(download_url: 'www.phatriddim.com') }
    it { should validate_uniqueness_of(:download_url) }

    it { should validate_presence_of(:circle_id) }
  end
end