module ProjectsHelper
  def member_of?
    current_user.projects.include? Project.find(params[:id])
  end

  def current_membership
    current_user.memberships.find_by_project_id(params[:id])
  end
end
