class AdminChatRoomController < ApplicationController
	before_action :admin_user 
	before_action :correct_user

	def index
    	@user = User.find(params[:id])
	end
end
