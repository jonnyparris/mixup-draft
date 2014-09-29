require_relative "./spec_helper"

describe Circle do
  describe "attributes" do
    it { should respond_to(:name) }
    it { should respond_to(:deadline) }

    #not sure whether to link this to producers yet 
    it { should respond_to(:created_by) }
  end

  describe "associations" do
    it { should belong_to(:remix).with_foreign_key('circle_id') }
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