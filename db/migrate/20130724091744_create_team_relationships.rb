class CreateTeamRelationships < ActiveRecord::Migration
  def change
    create_table :team_relationships do |t|
      t.integer :team_id

      t.timestamps
    end
  end
end
