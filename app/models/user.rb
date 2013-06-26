# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, 
                  :first_name, 
                  :last_name, 
                  :password, 
                  :password_confirmation, 
                  :teamrank, 
                  :reg_date, 
                  :last_date, 
                  :language, 
                  :age, 
                  :gender, 
                  :bio, 
                  :courses, 
                  :past_courses,
                  :avatar,
                  :city,
                  :avatar_cache
  has_many :clclassuseres
  has_many :clclass, :through=>:clclassuseres
  
  mount_uploader :avatar, AvatarUploader     
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
    
  #validates :first_name, presence: true, length: { maximum: 50 }
  #validates :last_name, presence: true, length: { maximum: 50 }
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
