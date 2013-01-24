# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  content      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  comment_id   :integer
#  comment_type :string(255)
#

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
