class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.string :length
      t.string :slides
      t.text :transcript
      t.references :lecture

      t.timestamps
    end
    add_index :videos, :lecture_id
  end
end
