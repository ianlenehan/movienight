# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  location   :text
#  imdb_id    :text
#  date       :date
#  time       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  details    :text
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :ratings
end
