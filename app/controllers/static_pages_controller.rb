class StaticPagesController < ApplicationController
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
end
