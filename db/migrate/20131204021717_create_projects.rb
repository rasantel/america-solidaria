class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :admin_id
      t.string :description

      t.timestamps
    end
  end
end
