module UsersHelper

	def other_name(chat)
		other_user(chat).name
	end

	def other_user(chat)
		if current_user.id = chat.second_user.id
			return chat.first_user
		else
			return chat.second_user
		end
	end

end
