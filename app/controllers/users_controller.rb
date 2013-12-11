class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :my_projects]
  before_action :correct_user,   only: [:edit, :update]
  before_action :correct_user_or_admin, only: :show
  before_action :admin_user,     only: :destroy

  def my_projects
    @projects = current_user.projects
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects.paginate(page: params[:page])
  end

  def new
  	@user = User.new
	
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  	@user = User.find(params[:id])
        @volunteer_app = @user.volunteer_app
  end

  def create
  	@user =  User.new(user_params)
  	if @user.save
          sign_in @user
          flash[:success] = "Welcome to the application portal!"
          redirect_to root_path
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
