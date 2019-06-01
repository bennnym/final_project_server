# == Schema Information
#
# Table name: students
#
#  id               :bigint(8)        not null, primary key
#  first_name       :string
#  last_name        :string
#  email            :text
#  university       :text
#  gpa              :float
#  profile_photo    :text
#  cv               :text
#  reserve_price    :integer
#  auction_duration :datetime
#  password_digest  :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  employer_id      :integer
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
