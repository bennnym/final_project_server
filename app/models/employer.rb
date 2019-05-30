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

class Employer < ApplicationRecord
  has_many :students
end