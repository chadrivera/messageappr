class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  validates_presence_of :user_id
  validates_presence_of :channel_id
end
