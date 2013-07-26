class AddUserIdToTeamRelationships < ActiveRecord::Migration
  def change
    add_column :team_relationships, :user_id, :integer
  end
end
