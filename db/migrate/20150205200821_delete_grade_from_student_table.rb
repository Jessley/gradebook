class DeleteGradeFromStudentTable < ActiveRecord::Migration
  def change
    remove_column :students, :grades
  end
end
