class Clclass < ActiveRecord::Base
   attr_accessible :course_id,
                   :class_description,
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
                   # :course_name,
                   :teacher
                   
   has_many :clclassesusers
   has_many :users, :through => :clclassesusers
   # has_and_belongs_to_many :users
   # has_many :users, foreign_key: "user_id"
   # accepts_nested_attributes_for :users

    # has_one :course, foreign_key: "id"
    # has_one :teacher, foreign_key: "id"

   # belongs_to :teacher
   
end
