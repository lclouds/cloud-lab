class ChangeColumnToUsers < ActiveRecord::Migration
  def change
    change_column :users, :last_date, :datetime
  end
end
