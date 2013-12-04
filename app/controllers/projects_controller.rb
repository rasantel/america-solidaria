class ProjectsController < ApplicationController
  before_action :signed_in_user

  def new
    @project = Project.new
  end

 def create
        @project =  Project.new(project_params)
        @project.admin_id = current_user.id
        if @project.save        
          flash[:success] = "New Project Created"
          redirect_to project_join_path(@project)
        else
                render 'new'
        end
  end

  def show
    @project = Project.find(params[:id])
    @admin = User.find_by_id(@project.admin_id)
    @posts = @project.posts.paginate(page: params[:page])
    @new_post = current_user.posts.build if signed_in?
  end

  def join
    @project = Project.find(params[:project_id])
    @m = @project.memberships.build(:user_id => current_user.id)
    respond_to do |f|
      if @m.save
        f.html { redirect_to(@project, :notice => 'You have joined this group.' ) }
      else
        f.html { redirect_to(@project, :notice => 'Join error.') }
      end
    end
  end

  def create_post
    @project = Project.find(params[:project_id])
    @p = @project.posts.build(post_params)
    @p.user_id = current_user.id
    respond_to do |f|
      if @p.save
        f.html { redirect_to(@project, :notice => 'You have posted to the project page.') }
      else
        f.html { redirect_to(@project, :notice => 'Post error.') }
      end
    end
  end


  def unjoin
    @m = Membership.where('project_id=? AND user_id=?', params[:project_id], current_user.id)
    @m.delete_all
    flash[:notice] = "You have been removed from this project"
    redirect_to :back
  end

  def index
    @projects = Project.paginate(page: params[:page])
  end

  private

  def project_params
        params.require(:project).permit(:name, :email, :description)
  end

  def post_params
  	params.require(:post).permit(:content)
  end

end
