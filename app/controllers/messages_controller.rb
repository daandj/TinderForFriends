class MessagesController < ApplicationController

	def create
		@chat = Chat.find_by_id(params[:chat_id])
		@message = @chat.messages.create(user_params
			.merge({user_id: session[:user_id]}))
		redirect_to chat_path(@chat)
	end

	private

	def user_params
		params.require(:message).permit(:body)
	end

end
