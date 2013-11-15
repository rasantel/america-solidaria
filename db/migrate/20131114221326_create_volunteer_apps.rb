class CreateVolunteerApps < ActiveRecord::Migration
  def change
    create_table :volunteer_apps do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :skype_name
      t.integer :user_id

      t.timestamps
    end
  end
end
