class AddCorrectToEanswers < ActiveRecord::Migration[5.1]
  def change
    add_column :eanswers, :correct, :boolean
  end
end
