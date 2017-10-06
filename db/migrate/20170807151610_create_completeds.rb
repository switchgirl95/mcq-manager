class CreateCompleteds < ActiveRecord::Migration[5.1]
  def change
    create_table :completeds do |t|
      t.belongs_to :student, index: true
      t.belongs_to :test, index: true
      t.boolean :true
      t.datetime :last_touched
      t.timestamps
    end
  end
end
