class VolunteerAppsController < ApplicationController

  before_action :signed_in_user
  before_action :admin_user,     only: :index

  def index    
    @volunteer_apps = VolunteerApp.paginate(page: params[:page])
  end

  def new 
    @user = User.find(params[:user_id])
    @volunteer_app = current_user.build_volunteer_app
  end

  def create
    @user = current_user
    @volunteer_app = current_user.build_volunteer_app(params[:volunteer_app].permit( :first_name,
    :last_name, :phone_number, :skype_name, :birth_date, :gender, :linked_in,
    :street_address, :city, :state, :zip, :country, :citizenship_country,
    :street_address_home, :city_home, :state_home, :zip_home, :country_home,
    :spanish_learned, :other_languages, :convicted, :visa_denied, :visa_explain) )


    @volunteer_app.user_id = current_user.id

    if @volunteer_app.save
      flash[:success] = "Basic Information Saved"
      redirect_to user_path(@user)
    else
     render 'new'
    end
  end

  def show
    @volunteer_app = VolunteerApp.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @volunteer_app = @user.volunteer_app
  end

  def update
    @volunteer_app = VolunteerApp.find(params[:id])
    @user = User.find_by_id(@volunteer_app.user_id)
    if (current_user.admin?) #this request was sent by the admin
      @volunteer_app = VolunteerApp.find(params[:id])
      @volunteer_app.update_attributes(params[:volunteer_app].permit( :status ))
      if @volunteer_app.status == "Accepted"
        @user.accepted = true
      end    


      flash[:success] = "Applicant Notified"
      redirect_to volunteer_apps_path
    else
    if @volunteer_app.update_attributes(params[:volunteer_app].permit(:first_name,
    :last_name, :phone_number, :skype_name, :birth_date, :gender, :linked_in,
    :street_address, :city, :state, :zip, :country, :citizenship_country,
    :street_address_home, :city_home, :state_home, :zip_home, :country_home,
    :spanish_learned, :other_languages, :convicted, :visa_denied, :visa_explain) )
      flash[:success] = "Application updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end
end


  def destroy
    VolunteerApp.find(params[:id]).destroy!
      redirect_to root_path
      
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  
end
