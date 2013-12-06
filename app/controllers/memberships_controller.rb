class MembershipsController < ApplicationController
  def create
    @membership = current_user.memberships.build(:project_id => params[:project_id])
    if @membership.save
      flash[:notice] = "You have added this user to the project."
      redirect_to :back
    else
      flash[:error] = "Unable to add."
      redirect_to :back
    end
  end

  def destroy
    @membership = current_user.memberships.find(params[:id])
    @membership.destroy
    flash[:notice] = "Membership removed."
      redirect_to :back
  end
end
