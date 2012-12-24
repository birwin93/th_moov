# == Schema Information
#
# Table name: loop_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  loop_id    :integer
#  status     :string(255)
#  creator    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe LoopMembership do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:open_loop) { FactoryGirl.create(:thmoov_loop) }
  let(:membership) { user.loop_memberships.build(loop_id: open_loop.id) }

  subject { membership }

 	describe "when loop_id is not present" do
  	before { membership.loop_id = nil }
  	it { should_not be_valid }
  end

  describe "status should be pending initially" do
  	before { membership.save }
  	its(:status) { should == "pending" }
  end




end
