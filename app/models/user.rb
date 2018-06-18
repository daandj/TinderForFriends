class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	has_secure_password

	has_many :messages

	def self.all_except(user)
		where.not(id: user)
	end

	def chats
		Chat.where("first_user_id = ? OR second_user_id = ?", self.id, self.id)
	end

	def friends
		chats.map { |chat| puts '-'; other_user(chat) }  
	end

	def find_friend
		exceptions = friends.map(&:id)
		puts exceptions
		User.all_except(friends.map(&:id) + [self.id]).sample
	end

	# private
# 
	# def other_user(chat)
		# if current_user = chat.second_user
			# chat.first_user
		# else
			# chat.second_user
		# end
	# end

end
