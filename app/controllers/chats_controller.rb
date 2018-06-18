class ChatsController < ApplicationController

	def show
		@chat = Chat.find_by_id(params[:id])
	end

end
