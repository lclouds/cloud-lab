module ClclassesHelper
  def get_course_by_clclass(clclass_id)
    return Course.find(clclass_id)
  end
  def get_currentcourse
    return Course.find(@clclass.course_id)
  end
  
  def applied_class?
    clclass_id = params[:clclass_id]?params[:clclass_id]:params[:id]
    applied = ClclassesUser.where(:user_id=>current_user.id, :clclass_id=>clclass_id).count
    
    if applied>0
      return true
    else 
      return false
    end
  end
end
