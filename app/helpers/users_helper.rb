module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
  
  def add_class?
    !ClclassesUser.where(:user_id=>current_user.id).nil?
  end
end
