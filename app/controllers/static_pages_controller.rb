class StaticPagesController < ApplicationController
  skip_authorization_check
  
  def home
    @clclasses = Clclass.all
    
  end

  def help
  end
  
  def terms
  end
  
  def about
  end
  
  def contact
  end
  def unauth
    
  end
end
