class CreateClclassesUsers < ActiveRecord::Migration
  def change
    create_table :clclasses_users do |t|
      t.integer :clclass_id
      t.integer :user_id

      t.timestamps
    end
  end
end
