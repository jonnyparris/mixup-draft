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
    it { should respond_to(:password_hash) }
  end

  describe "associations" do
  it { should have_many(:stems) }
  it { should have_many(:remixes).with_foreign_key('remixer_id') }
  it { should have_many(:circles) }
  it { should have_many(:circles).through(:remixes) }
  end

  before :all do
    Producer.delete_all
  end

  describe "validations" do
    it "is valid with a producer_name, email, and confirmed password" do
      valid_user = Producer.new(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta', password_confirmation: 'boselecta')
      expect(valid_user).to be_valid
    end

    it "is invalid without a producer_name" do
      allow_any_instance_of(Producer).to receive(:password).and_return('Wibble')
      expect(Producer.new(producer_name: nil)).to have(1).errors_on(:producer_name)
    end

    it "is invalid without an email" do
      # expect 2 errors, 1 for nil email, 1 for invalid email format
      allow_any_instance_of(Producer).to receive(:password).and_return('Wibble')
      expect(Producer.new(email: nil)).to have(2).errors_on(:email)
    end

    it "is invalid with a crappy email address" do
      allow_any_instance_of(Producer).to receive(:password).and_return('Wibble')
      expect(Producer.new(email: 'not_an_email')).to have(1).errors_on(:email)
    end

    it "is invalid without a password" do
      # expect(Producer.new(password: nil)).to have(1).errors_on(:password)
      expect(Producer.new(password: nil).valid?).not_to eq(true)
    end

    it "is invalid without a password confirmation" do
      expect(Producer.new(producer_name: 'D-Rok', email: 'drop@dabass.com', password: 'boselecta', password_confirmation: 'alzheimers')).to have(1).errors_on(:password_confirmation)
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
  end
  
end