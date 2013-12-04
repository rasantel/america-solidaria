class MembershipsController < ApplicationController
  def create
    @membership = current_user.memberships.build(:project_id => params[:project_id])
    if @membership.save
      flash[:notice] = "You have joined this group."
      redirect_to :back
    else
      flash[:error] = "Unable to join."
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
