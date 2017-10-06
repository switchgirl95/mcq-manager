class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.belongs_to :question, index: true
      t.belongs_to :evaluation, index: true
      
      t.timestamps
    end
add_reference :responses, :answer, index: true
  end
end