class AddRememberTokenToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :password_digest, :string
    add_column :teachers, :remember_token, :string
    add_column :teachers, :avatar, :string
    remove_column :teachers,:pwd
    add_index :teachers, :remember_token
    add_index :teachers, :email
  end
end
