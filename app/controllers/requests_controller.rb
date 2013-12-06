class RequestsController < ApplicationController
def create
  @membership = current_user.memberships.build(:project_id => params[:project$
    if @membership.save
      flash[:notice] = "You have requested to join this group"
      redirect_to :back
    else
      flash[:error] = "Unable to join."
      redirect_to :back
    end
  end

  def destroy
    @membership = current_user.requests.find(params[:id])
    @membership.destroy
      redirect_to :back
  end


end
