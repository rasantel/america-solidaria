class PostsController < ApplicationController
  before_action :signed_in_user

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.project_id = params[:project_id]
    if @post.save
      flash[:notice] = "You have posted to the project page."
      redirect_to :back
    else
      flash[:error] = "Unable to complete post."
      redirect_to :back
    end
  end
  
  def destroy
  end

  private
  
  def post_params
    params.require(:post).permit(:content)
  end
end
