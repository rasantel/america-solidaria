class VolunteerAppsController < ApplicationController
  before_action :set_user
  before_action :signed_in_user

  def set_user
    @user = User.find(params[:user_id]) 
  end

  def new 
    @volunteer_app = current_user.build_volunteer_app
  end

  def create
    @volunteer_app = current_user.build_volunteer_app(params[:volunteer_app].permit( :first_name,
    :last_name, :phone_number, :skype_name) )
    @volunteer_app.user_id = current_user.id

    if @volunteer_app.save
      flash[:success] = "Basic Information Saved"
      redirect_to user_path(@user)
    else
     render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @volunteer_app = @user.volunteer_app
  end

  def edit
    @volunteer_app = VolunteerApp.find_by_user_id(current_user.id)
  end

  def update
    @volunteer_app = current_user.volunteer_app
    if @volunteer_app.update_attributes(params[:volunteer_app].permit( :first_name,
    :last_name, :phone_number, :skype_name) )
      flash[:success] = "Application updated"
      redirect_to current_user
    else
      render 'edit'
    end

  end
  
end
