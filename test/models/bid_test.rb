# == Schema Information
#
# Table name: bids
#
#  id          :bigint(8)        not null, primary key
#  employer_id :integer
#  student_id  :integer
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company     :string
#

require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
