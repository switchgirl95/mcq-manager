class RemoveScoreFromTest < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :score, :float
  end
end
