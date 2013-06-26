class CreateClclassTeachers < ActiveRecord::Migration
  def change
    create_table :clclass_teachers do |t|
      t.integer :clclass_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
