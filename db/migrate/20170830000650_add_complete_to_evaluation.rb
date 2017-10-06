class AddCompleteToEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :complete, :boolean
  end
end
