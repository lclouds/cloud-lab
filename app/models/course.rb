class Course < ActiveRecord::Base
  attr_accessible :name,
                  :course_name,
                  :course_code,
                  :course_introduction
  
end
