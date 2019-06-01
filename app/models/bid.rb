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
#

class Bid < ApplicationRecord
  belongs_to :employer
  belongs_to :student 
end
