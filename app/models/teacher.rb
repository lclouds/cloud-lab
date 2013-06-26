class Teacher < ActiveRecord::Base
  attr_accessible :address, :alias_name, :comment, :deleted, :email, 
        :first_name, :image_url, :last_name, :mobile, :position, :postcode, :password, 
        :resume, :telephone, :title, :valid_certificate, :valid_certificate_no,
        :password_confirmation,:remember_token,:avatar,:avatar_cache

  mount_uploader :avatar, AvatarUploader     
  before_save { |user| user.email = email.downcase }
  before_save  :create_remember_token
  validate :password_validate
  has_secure_password 

  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_confirmation, presence: true

  protected
  def password_validate
    if self.password_digest.nil? 
      if self.password.nil?
        errors.add(:password,"password must be not null") 
      end
    end
    if !self.password.nil? &&  self.password.length<6
        errors.add(:password,"length must be grant than 6")
      
    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
  
end
  