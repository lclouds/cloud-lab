class ClclassesUser < ActiveRecord::Base
  attr_accessible :clclass_id, :user_id
  belongs_to :Clclass
  belongs_to :User
end
