# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  rating_score :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  event_id     :integer
#  user_id      :integer
#

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
