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
  has_many :students, through: :bids 
  has_many :bids

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
end
