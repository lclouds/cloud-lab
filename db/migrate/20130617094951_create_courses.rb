class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :course_name
      t.integer :course_code
      t.text :description

      t.timestamps
    end
  end
end
