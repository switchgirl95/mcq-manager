class AddScoreToEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :score, :float
  end
end
