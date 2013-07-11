class Lecture < ActiveRecord::Base
   attr_accessible :name,
                   :key_concepts,
                   :reading,
                   :assignment,
                   :additional_rsources,
                   :course_id
                   
    belongs_to :clclass
    has_many :video
end
