class AddUserIdToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :user_id, :integer
    add_index :user_infos, [:user_id, :created_at]
  end
end
