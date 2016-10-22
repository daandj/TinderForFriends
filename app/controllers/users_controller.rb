class UsersController < ApplicationController
	before_filter :authorize, only: [:show_profile, :edit, :update]

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
		puts user_params.class
		if user.update_attributes(user_params)
			redirect_to '/profile'
		else
			redirect_to '/profile/edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
