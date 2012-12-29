# == Schema Information
#
# Table name: event_memberships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#  author_id  :integer
#

require 'spec_helper'

describe EventMembership do
  pending "add some examples to (or delete) #{__FILE__}"
end
