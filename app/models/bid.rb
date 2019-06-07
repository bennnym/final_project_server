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

class Bid < ApplicationRecord
  belongs_to :employer
  belongs_to :student 
 default_scope {order("#{self.table_name}.amount DESC")} # this sorts bids by highest to lowest
end
