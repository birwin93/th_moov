require 'spec_helper'

describe "LoopEventShares" do
  describe "GET /loop_event_shares" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get loop_event_shares_path
      response.status.should be(200)
    end
  end
end
