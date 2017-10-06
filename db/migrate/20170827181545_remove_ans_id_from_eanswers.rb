class RemoveAnsIdFromEanswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :eanswers, :ans_id, :integer
  end
end
