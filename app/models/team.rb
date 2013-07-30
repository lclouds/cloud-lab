class Team < ActiveRecord::Base
  has_many :team_relationships, dependent: :destroy
  has_many :users, through: :team_relationships

  attr_accessible :avatar, :description, :name, :avatar_cache, :remove_avatar
  mount_uploader :avatar, AvatarUploader
  before_save { |team| team.name = name.downcase }
  validates :name,
        presence: true,
        length: { maximum: 140 },
        uniqueness: { case_sensitive: false }

  def self.search(params)
    arel = order('created_at DESC').page(params[:page]).per_page(5) # note: default is all, just sorted
    arel = arel.where('name LIKE ?', "%#{params[:name]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:name].present?
    arel = arel.where('description LIKE ?', "%#{params[:description]}%").order('created_at DESC').page(params[:page]).per_page(5) if params[:description].present?
    arel
  end

end
