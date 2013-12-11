class AddStatusToVolunteerApps < ActiveRecord::Migration
  def change
    add_column :volunteer_apps, :status, :string, default: "Pending Review"
  end
end

