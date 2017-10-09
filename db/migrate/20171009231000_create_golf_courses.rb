class CreateGolfCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :golf_courses do |t|
      t.string :name
      t.string :description
      t.integer :holes
      t.integer :total_par
      t.integer :course_slope
      t.float :course_rating

      t.timestamps null: false
    end
  end
end
