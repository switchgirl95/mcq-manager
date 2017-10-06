class AddAnswerToEanswers < ActiveRecord::Migration[5.1]
  def change
    add_column :eanswers, :answer, :text
  end
end
