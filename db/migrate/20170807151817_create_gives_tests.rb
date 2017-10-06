class CreateGivesTests < ActiveRecord::Migration[5.1]
  def change
    create_table :gives_tests do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :test, index: true
      t.timestamps
    end
  end
end
