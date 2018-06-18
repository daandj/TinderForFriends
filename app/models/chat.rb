class Chat < ActiveRecord::Base
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'
	has_many :messages

	def self.find_incomplete_chat
		Chat.where(second_user_id: nil).first
	end

end
