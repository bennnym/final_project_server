# == Schema Information
#
# Table name: employers
#
#  id              :bigint(8)        not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :text
#  company         :string
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class EmployerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
