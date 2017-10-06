class AddTotalcorToEquestion < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :totalcorr, :integer
    add_column :equestions, :totalcorr, :integer
    add_column :equestions, :totalgot, :integer
  end
end
