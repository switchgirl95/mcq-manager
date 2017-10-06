class RemoveAnswerFromEanswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :eanswers, :answer, :text
  end
end
