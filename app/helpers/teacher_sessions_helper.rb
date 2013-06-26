module TeacherSessionsHelper
  
  def teacher_sign_in(teacher)
    cookies.permanent[:teacher_remember_token] = teacher.remember_token
    self.current_teacher = teacher
  end
  
  def teacher_signed_in?
    !current_teacher.nil?
  end
  
  def current_teacher=(teacher)
    @current_teacher = teacher
  end
  
  def current_teacher?(teacher)
    teacher == current_teacher
  end
  
  def current_teacher
    @current_teacher ||= Teacher.find_by_remember_token(cookies[:teacher_remember_token])
  end
  
  def teacher_sign_out
    self.current_teacher = nil
    cookies.delete(:teacher_remember_token)
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

end
