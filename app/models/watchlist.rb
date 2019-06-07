# == Schema Information
#
# Table name: watchlists
#
#  id           :bigint(8)        not null, primary key
#  employer_id  :integer
#  student_id   :integer
#  student_name :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Watchlist < ApplicationRecord
  belongs_to :employer
  belongs_to :student 
end
