class AddCompleteToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :complete, :boolean
  end
end
