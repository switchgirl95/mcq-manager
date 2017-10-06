class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.belongs_to :clazz, index: true
      t.string :sub_code, :limit => 10
      t.string :sub_name
      t.timestamps
    end
	add_index :subjects, :sub_code, unique: true

  end
end
