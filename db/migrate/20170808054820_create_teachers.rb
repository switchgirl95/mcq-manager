class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :nom
      t.string :prenoms
      t.string :password
      t.integer :status
      t.timestamps
    end
  end
end
