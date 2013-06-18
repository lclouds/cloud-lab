class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teamrank, :string
    add_column :users, :reg_date, :date
    add_column :users, :last_date, :date
    add_column :users, :language, :string
    add_column :users, :age, :string
    add_column :users, :gender, :string
    add_column :users, :bio, :text
    add_column :users, :courses, :string
    add_column :users, :past_courses, :string
  end
end
