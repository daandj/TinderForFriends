class UsersController < ApplicationController
	before_filter :authorize, only: [:show_profile, :edit, :update, :chats, 
																	:new_chat]

	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def show_profile
	end

	def edit
	end

	def update
		user = User.find_by_id(session[:user_id])
		if user.update_attributes(user_params)
			redirect_to '/profile'
		else
			redirect_to '/profile/edit'
		end
	end

	def chats
		@chats = current_user.chats
	end

	def new_chat
		if new_friend = current_user.find_friend
			puts "Friend found. :)"
			chat = Chat.create(first_user: current_user, second_user: new_friend)
			redirect_to chat_path(chat.id)
		else
			puts "No friend found. :("
			redirect_to chats_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
