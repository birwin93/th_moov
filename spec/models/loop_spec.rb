require 'spec_helper'

describe Loop do
  
  before do
  	@loop = Loop.new(name: "Th Moov", privacy: "open",
											description: "A startup formed by 6 UofM Students.")
  end

  it { should respond_to(:name) }
  it { should respond_to(:privacy) }
  it { should respond_to(:description) }

  describe "when name is not present" do
  	before { @loop.name = "" }
  	it { should_not be_valid }
  end

  describe "when privacy is not present" do
  	before { @loop.privacy = "" }
  	it { should_not be_valid }
  end

 
end
