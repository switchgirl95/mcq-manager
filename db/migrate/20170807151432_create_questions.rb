class CreateQuestions < ActiveRecord::Migration[5.1]
  def change 
    create_table :questions do |t|
      t.belongs_to :test, index: true
      t.text :question
      t.timestamps
    end
  end
end
