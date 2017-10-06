class AddScoreToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :score, :float
  end
end
