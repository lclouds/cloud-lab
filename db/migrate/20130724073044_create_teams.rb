class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :avatar
      t.text :description
      t.string :creator_name
      t.integer :user_id

      t.timestamps
    end
  end
end
