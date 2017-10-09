class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :score
      t.integer :golfer_id
      t.integer :golf_course_id

      t.timestamps null: false
    end
  end
end
