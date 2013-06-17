class Clclass < ActiveRecord::Base
   attr_accessible :class_description,
                   :starting_date,
                   :teaser,
                   :schedule,
                   :workload,
                   :technical_requirements,
                   :prerequisites,
                   :course_content,
                   :team_projects,
                   :evaluation,
                   :statement_accomplishment,
                   :course_name,
                   :teacher
    # has_one :course, foreign_key: "id"
    # has_one :teacher, foreign_key: "id"

   # belongs_to :teacher
   
end
