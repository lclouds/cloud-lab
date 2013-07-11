class Video < ActiveRecord::Base
  attr_accessible :length, :name, :slides, :transcript, :url
  belongs_to :lecture
end
