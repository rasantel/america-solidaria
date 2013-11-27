include UsersHelper
class PublicChatRoomController < ApplicationController
	before_action :correct_user

	def index
    	@currentUser = User.find(params[:id])
	end
end
