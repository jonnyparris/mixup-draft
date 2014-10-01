require_relative "./spec_helper"

describe Producer do
  describe "attribute" do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:producer_name) }
    it { should respond_to(:email) }
    it { should respond_to(:avatar) }
    it { should respond_to(:location) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authentication) }
  end

  describe "associations" do
  it { should have_many(:stems) }
  it { should have_many(:remixes) }
  it { should have_many(:circles).through(:remixes) }
  end

  describe "validations" do
    it "is valid with a producer_name, email, and password" do
      valid_user = Producer.new(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta')
      expect(valid_user).to be_valid
    end

    it "is invalid without a producer_name" do
      expect(Producer.new(producer_name: nil)).to have(1).errors_on(:producer_name)
    end

    it "is invalid without an email" do
      expect(Producer.new(email: nil)).to have(1).errors_on(:email)
    end

    it "is invalid without a password" do
      expect(Producer.new(password: nil)).to have(1).errors_on(:password)
    end

    it "is invalid with a duplicate email address" do
      Producer.create(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta')
      pro_dj = Producer.new(producer_name: 'J-dizzle', email: 'drop@dabass.com', password: 'boselecta')
      expect(pro_dj).to have(1).errors_on(:email)
    end

    it "is invalid with a duplicate producer_name" do
      Producer.new(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta')
      pro_dj = Producer.new(producer_name: 'D-Rok', email: 'drop@damelody.com', password: 'boselecta')
      expect(pro_dj).to have(1).errors_on(:producer_name)
    end

    it "is invalid with a crappy email address" do
      expect(Producer.new(email: 'not_an_email')).to have(1).errors_on(:email)
    end
  end
  
end