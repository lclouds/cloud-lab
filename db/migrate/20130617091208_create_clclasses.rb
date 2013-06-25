class CreateClclasses < ActiveRecord::Migration
  def change
    create_table :clclasses do |t|
      t.string :course_name
      t.string :teacher
      t.text :class_description
      t.date :starting_date
      t.string :teaser
      t.string :schedule
      t.string :workload
      t.text :technical_requirements
      t.text :prerequisites
      t.text :course_content
      t.text :team_projects
      t.text :evaluation
      t.text :statement_accomplishment
      
      t.references :user
      t.timestamps
    end
  end
end
