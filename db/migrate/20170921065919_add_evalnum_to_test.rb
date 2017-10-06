class AddEvalnumToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :evalnum, :integer
  end
end
