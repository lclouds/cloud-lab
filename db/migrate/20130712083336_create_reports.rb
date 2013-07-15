class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.references :user
      t.references :exercise
      t.datetime :submit_time
      t.text :problems_solutions

      t.timestamps
    end
    add_index :reports, :user_id
    add_index :reports, :exercise_id
  end
end
