class CreateVolunteerApps < ActiveRecord::Migration
  def change
    drop_table :volunteer_apps

    create_table :volunteer_apps do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :skype_name

      t.date  :birth_date
      t.string :gender
      t.string :linked_in
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :citizenship_country
      t.string :street_address_home
      t.string :city_home
      t.string :state_home
      t.integer :zip_home
      t.string :country_home
      t.string :spanish_learned
      t.string :other_languages
      t.string :convicted
      t.string :visa_denied
      t.string :visa_explain

      t.integer :user_id


      t.timestamps
    end
  end
end
