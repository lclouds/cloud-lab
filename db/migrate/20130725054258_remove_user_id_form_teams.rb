class RemoveUserIdFormTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :creator_name
    remove_column :teams, :user_id
  end
end
