class RemoveAnswerIdFromEanswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :eanswers, :answer_id, :integer
  end
end
