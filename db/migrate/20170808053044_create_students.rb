class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :matricule, :limit => 10
      t.string :nom
      t.string :prenoms
      t.string :password
      t.timestamps
    end
    add_index :students, :matricule, unique: true
  end
end
