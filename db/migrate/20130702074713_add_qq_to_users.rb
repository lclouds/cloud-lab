class AddQqToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
    rename_column :users, :teamrank, :mobile 
    rename_column :users, :courses, :education
    remove_column :users, :past_courses
  end
end
