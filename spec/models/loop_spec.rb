# == Schema Information
#
# Table name: loops
#
#  id                  :integer          not null, primary key
#  privacy             :string(255)
#  name                :string(255)
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'spec_helper'

describe Loop do
  
  before do
  	@loop = Loop.new(name: "Th Moov", privacy: "open",
											description: "A startup formed by 6 UofM Students.")
  end

  subject { @loop }

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
