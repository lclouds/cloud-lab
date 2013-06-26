class Lecture < ActiveRecord::Base
   attr_accessible :name,
                   :video,
                   :slides,
                   :transcript,
                   :key_concepts,
                   :reading,
                   :assignment,
                   :additional_rsources,
                   :course_id
                   
    belongs_to :clclass
end
