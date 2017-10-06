class CreateEquestions < ActiveRecord::Migration[5.1]
  def change
    create_table :equestions do |t|
      t.belongs_to :evaluation, index: true
      t.text :question
      t.timestamps
    end
  end
end
