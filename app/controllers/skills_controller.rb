class SkillsController < ApplicationController

  before_action :signed_in_user

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @skill = current_user.build_skill
  end

  def create
    @user = current_user
    @skill = current_user.build_skill(params[:skill].permit( :education,
      :school_name1, :degree1, :area_of_study1, :gpa1, :graduation1,
      :school_name2, :degree2, :area_of_study2, :gpa2, :graduation2,
      :school_name3, :degree3, :area_of_study3, :gpa3, :graduation3,
      :skill1, :skill1_years, :skill2, :skill2_years, :skill3, :skill3_years,
      :employment_situation, :occupation, :organization) )

    @skill.user_id = current_user.id

    if @skill.save
      flash[:success] = "Education, Skills, and Employment Information Saved"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end  

  def show
    @skill = Skill.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @skill = @user.skill
  end

  def update
    @user = User.find(params[:user_id])
    @skill = current_user.skill
    if @skill.update_attributes(params[:skill].permit( :education,
      :school_name1, :degree1, :area_of_study1, :gpa1, :graduation1,
      :school_name2, :degree2, :area_of_study2, :gpa2, :graduation2,
      :school_name3, :degree3, :area_of_study3, :gpa3, :graduation3,
      :skill1, :skill1_years, :skill2, :skill2_years, :skill3, :skill3_years,
      :employment_situation, :occupation, :organization) )
      flash[:success] = "Application updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    Skill.find(params[:id]).destroy!
    redirect_to current_user
  end

end
