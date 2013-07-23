class Conversation < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_messageable
end
