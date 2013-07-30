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
                  :remove_avatar,
                  :team_id

  has_many :clclassuseres, dependent: :destroy
  has_many :clclass, :through=>:clclassuseres

  has_many :team_relationships, dependent: :destroy
  has_many :teams, through: :team_relationships

  mount_uploader :avatar, AvatarUploader
  acts_as_messageable
  has_secure_password
  validate :password_validate
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
  #  validates :password, presence: true, length: { minimum: 6 }
  #  validates :password_confirmation, presence: true

  def admin?
    if email == 'lclouds.ddy@gmail.com'
    return true
    else
    return false
    end
  end

  def name
#        return "#{first_name} #{last_name}"
    email
  end

   def mailboxer_email(object)
  #Check if an email should be sent for that object
  #if true
     return "#{email}"
  #if false
  #return nil
  end
  

  def self.search(params)

    arel = order('created_at DESC').page(params[:page]).per_page(5) # note: default is all, just sorted,.paginate(:page => params[:page], :per_page => 5)
    arel = arel.where('first_name LIKE ? OR last_name LIKE ?', 
                     "%#{params[:search]}%", "%#{params[:search]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:search].present?
    arel = arel.where('city LIKE ?', "%#{params[:city]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:city].present?
    arel = arel.where('gender LIKE ?', "%#{params[:gender]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:gender].present?
    arel = arel.where('education LIKE ?', "%#{params[:education]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:education].present?
    arel = arel.where('email LIKE ?', "%#{params[:email]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:email].present?  
    arel
  
  end

  protected

  def password_validate
    if self.password_digest.nil?
      if self.password.nil?
        errors.add(:password,"password must be not null")
      end
    end
    if !self.password.nil? &&  self.password.length!=0 &&  self.password.length<6
      errors.add(:password,"length must be grant than 6")

    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end

