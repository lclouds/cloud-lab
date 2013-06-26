class ClclcassDetails < ActiveRecord::Migration
  def up
    add_column :clclasses, :course_id, :integer
    remove_column :clclasses, :course_name
  end

  def down
    remove_column :clclasses, :course_id
    add_column :clclasses, :course_name, :string
  end
end
