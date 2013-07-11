class VideoLecture < ActiveRecord::Migration
  def up
    remove_column :lectures, :video
    remove_column :lectures, :slides
    remove_column :lectures, :transcript
  end

  def down
    add_column :lectures, :video, :string
    add_column :lectures, :slides, :string
    add_column :lectures, :transcript, :text
  end
end
