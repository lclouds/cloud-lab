class Report < ActiveRecord::Base
  attr_accessible :name, :problems_solutions, :submit_time
  belongs_to :user
  belongs_to :exercise
end
