require_relative "./spec_helper"

describe Stem do
	#tests that the model has attributes
  it { should respond_to(:track_name) }
  it { should respond_to(:download_url) }
  it { should respond_to(:owner) }

  it "is valid with a track_name, download_url, and owner" do

  end

  it "is invalid without a track_name" do
    
  end

  it "is invalid without an download_url" do
    
  end

  it "is invalid without a owner" do

  end

end