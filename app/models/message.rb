class Message < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :message
end
