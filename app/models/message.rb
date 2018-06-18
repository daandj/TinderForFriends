class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat
	
	validates_presence_of :user
	validates_presence_of :chat
	validates_presence_of :body
end
