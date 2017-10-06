class AddClazzToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :clazz, foreign_key: true
  end
end
