class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
	  t.string :dept_code, :limit => 10
	  t.string :dept_name
      t.timestamps
    end
	add_index :departments, :dept_code, unique: true
  end
end
