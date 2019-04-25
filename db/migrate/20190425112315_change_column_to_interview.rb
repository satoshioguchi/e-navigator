class ChangeColumnToInterview < ActiveRecord::Migration[5.1]
  
  def up
    change_column :interviews, :propriety, :integer, default: 3
  end

  def down
    change_column :interviews, :propriety, :integer
  end
end
