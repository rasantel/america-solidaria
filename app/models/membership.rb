class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates_uniqueness_of :project_id, :message => "You are already a member of this project", :scope => 'user_id'
  validates_presence_of :project, :user
end
