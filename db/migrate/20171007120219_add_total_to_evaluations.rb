class AddTotalToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :total, :integer
  end
end
