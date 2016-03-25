# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  name_first      :text
#  name_last       :text
#  password_digest :text
#  image           :text
#  admin           :boolean          default("false")
#  group_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_and_belongs_to_many :events
  belongs_to :group
  has_many :ratings
end
