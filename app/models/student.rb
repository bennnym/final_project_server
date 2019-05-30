# == Schema Information
#
# Table name: students
#
#  id               :bigint(8)        not null, primary key
#  first_name       :string
#  last_name        :string
#  email            :text
#  university       :text
#  gpa              :decimal(, )
#  profile_photo    :text
#  cv               :text
#  reserve_price    :integer
#  auction_duration :datetime
#  password_digest  :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Student < ApplicationRecord
  belongs_to :employers, :optional => true
end
