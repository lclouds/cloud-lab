class TeacherSessionsController < ApplicationController
  layout "teachers"
  def new
    render 'new'
  end

  def create
    teacher = Teacher.find_by_email(params[:teacher_session][:email].downcase)
    if teacher && teacher.authenticate(params[:teacher_session][:password])
      #teacher_sign_in teacher
      session[:teacher] = teacher
      redirect_to teacher_root_path
      #redirect_to teacher
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    teacher = session[:teacher]
    if teacher 
      #teacher_sign_out 
    end
    session[:teacher] = nil
    redirect_to teacher_root_path
  end
end
