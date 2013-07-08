class Video < ActiveRecord::Base
  belongs_to :lecture
  attr_accessible :length, :name, :slides, :transcript, :url
end
