class Course < ActiveRecord::Base
  attr_accessible :name, 
                  :course_name, 
                  :course_code,
                  :description
  has_many :lectures
end
