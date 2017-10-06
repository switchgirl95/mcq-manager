class CreateClazzs < ActiveRecord::Migration[5.1]
  def change
    create_table :clazzs do |t|
      t.belongs_to :department, index: true
      t.string :class_code, :limit => 10
      t.integer :level
      t.timestamps
    end
	add_index :clazzs, :class_code, unique: true
  end
end
