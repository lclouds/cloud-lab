class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :video
      t.string :slides
      t.string :transcript
      t.text :key_concepts
      t.text :reading
      t.text :assignment
      t.text :additional_rsources
      t.integer :course_id
      
      t.integer :clclass_id
      
      t.timestamps
    end
  end
  
  def down
    drop_table :lectures
  end
end
