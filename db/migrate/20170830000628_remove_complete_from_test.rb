class RemoveCompleteFromTest < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :complete, :boolean
  end
end
