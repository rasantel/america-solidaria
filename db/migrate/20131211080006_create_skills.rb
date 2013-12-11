class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :education
      t.string :school_name1
      t.string :degree1
      t.string :area_of_study1
      t.float :gpa1
      t.date :graduation1
      
      t.string :school_name2
      t.string :degree2
      t.string :area_of_study2
      t.float :gpa2
      t.date :graduation2

      t.string :school_name3
      t.string :degree3
      t.string :area_of_study3
      t.float :gpa3
      t.date :graduation3

      t.string :skill1
      t.integer :skill1_years
      t.string :skill2
      t.integer :skill2_years
      t.string :skill3
      t.integer :skill3_years

      t.string :employment_situation

      t.string :occupation
      t.string :organization
      t.string :title
      t.date :start_date

      t.timestamps
    end
  end
end
