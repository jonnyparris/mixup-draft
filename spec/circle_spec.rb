require_relative "./spec_helper"

describe Circle do
  describe "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:signup_deadline) }
    it { should respond_to(:submit_deadline) }

    #not sure whether to link this to producers yet 
    it { should respond_to(:creator) }
  end

  describe "associations" do
    it { should belong_to(:producer).with_foreign_key('creator_id') }
    it { should have_many(:remix) }
  end

  describe "validations" do    
    it "is valid with a name and deadline" do
      valid_circle = Circle.new(name: 'Xmas Giggles', deadline: '25/12/2014')
      expect(valid_circle).to be_valid
    end

    it "is invalid without a name" do
      expect(Circle.new(name: nil)).to have(1).errors_on(:name)
    end

    it "is invalid without a deadline" do
      expect(Circle.new(deadline: nil)).to have(1).errors_on(:deadline)    
    end

    #trying out the shoulda-matcher gem
    subject { Circle.new(name: 'www.phatriddim.com') }
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name) }
  end
end