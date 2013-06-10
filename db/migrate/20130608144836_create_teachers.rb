class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :last_name
      t.string :first_name
      t.string :alias_name
      t.string :valid_certificate
      t.string :valid_certificate_no
      t.string :email
      t.string :telephone
      t.string :mobile
      t.string :address
      t.string :postcode
      t.string :职称
      t.string :职务
      t.integer :unit_id
      t.string :resume
      t.string :头像
      t.string :regist_name
      t.string :pwd
      t.integer :role_id
      t.text :comment
      t.integer :deleted
      
    

      t.timestamps
    end
  end
end
