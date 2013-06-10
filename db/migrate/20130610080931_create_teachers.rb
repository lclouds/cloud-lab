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
      t.string :title
      t.string :position
      t.text :resume
      t.string :image_url
      t.string :regist_name
      t.string :pwd
      t.string :comment
      t.integer :deleted

      t.timestamps
    end
  end
end
