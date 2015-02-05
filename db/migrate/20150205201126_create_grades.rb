class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.string :grade
      t.date :date
      t.string :grade_type

      t.timestamps null: false
    end
  end
end
