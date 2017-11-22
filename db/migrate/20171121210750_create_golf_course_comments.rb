class CreateGolfCourseComments < ActiveRecord::Migration[5.1]
  def change
    create_table :golf_course_comments do |t|
      t.string :content
      t.integer :golfer_id
      t.integer :golf_course_id

      t.timestamps null: false
    end
  end
end
