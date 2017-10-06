class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.belongs_to :subject, index: true
      t.string :title
      t.text :objective
      t.timestamps
    end
  end
end
