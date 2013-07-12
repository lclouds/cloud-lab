class Exercise < ActiveRecord::Base
  attr_accessible :action_items, :deadline, :description, :name, :special_instruction, :start_date
  belongs_to :lecture
  belongs_to :clclass
end
