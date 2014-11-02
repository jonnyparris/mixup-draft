require_relative "./spec_helper"

describe Remix do
  describe "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:download_url) }
    it { should respond_to(:circle) }
    it { should respond_to(:stem) }    
    it { should respond_to(:remixer_id) }    
  end

  describe "associations" do
    it { should belong_to(:producer).with_foreign_key('remixer_id') }
    it { should belong_to(:stem) }
    it { should belong_to(:circle) }
  end

  describe "validations" do    
    it "is valid with a circle and stem" do
      Stem.delete_all
      Circle.delete_all
      Producer.delete_all
      Circle.create(name: 'Xmas Giggles', signup_deadline: '1/12/2014', submit_deadline: '25/12/2014')
      Producer.create(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta', password_confirmation: 'boselecta')
      Stem.create(track_name: 'Peanut Butter Jammin',download_url: "http://www.reddit.com/r/IsolatedVocals/top/", producer: Producer.first)
      valid_stem = Remix.new(circle: Circle.first, stem: Stem.first)
      expect(valid_stem).to be_valid
    end

    it "is invalid without a circle" do
      expect(Remix.new(circle: nil)).to have(1).errors_on(:circle)
    end

    it "is invalid without an stem" do
      expect(Remix.new(stem: nil)).to have(1).errors_on(:stem)    
    end

    #trying out the shoulda-matcher gem
    subject { Remix.new(download_url: 'www.phatriddim.com') }
    # it { should validate_uniqueness_of(:download_url) }

    it { should validate_presence_of(:circle) }
  end
end