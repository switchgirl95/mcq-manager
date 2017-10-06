class CreateEanswers < ActiveRecord::Migration[5.1]
  def change
    create_table :eanswers do |t|
      t.belongs_to :equestion, index: true
      t.integer :ans_id
      t.boolean :ticked
      t.timestamps
    end
  end
end
