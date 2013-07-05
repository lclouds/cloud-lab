
class User < ActiveRecord::Base
  attr_accessible :email, 
                  :first_name, 
                  :last_name, 
                  :password, 
                  :password_confirmation, 
                  :qq,
                  :mobile, 
                  :reg_date, 
                  :last_date, 
                  :language, 
                  :age, 
                  :gender, 
                  :bio, 
                  :education, 
                  :avatar,
                  :city,
                  :avatar_cache,
                  :remove_avatar

  has_many :clclassuseres, dependent: :destroy
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
