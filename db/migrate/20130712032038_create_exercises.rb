class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.text :special_instruction
      t.text :action_items
      t.datetime :start_date
      t.datetime :deadline
      t.references :lecture
      t.references :clclass

      t.timestamps
    end
    add_index :exercises, :lecture_id
    add_index :exercises, :clclass_id
  end
end
