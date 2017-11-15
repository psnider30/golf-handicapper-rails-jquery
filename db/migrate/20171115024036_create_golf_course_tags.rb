class CreateGolfCourseTags < ActiveRecord::Migration[5.1]
  def change
    create_table :golf_course_tags do |t|
      t.integer :golf_course_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
