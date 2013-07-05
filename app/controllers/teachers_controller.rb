class TeachersController < ApplicationController
  load_and_authorize_resource
  
  before_filter :check_teacher_login, only: [:home]
  before_filter :signed_in_teacher, only: [:index,:edit, :update]
  before_filter :correct_teacher,   only: [:edit, :update] 

  layout "teachers"
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        sign_in @teacher
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        sign_in @teacher
        format.html { redirect_to teacher_root_path, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def home
    @teacher = current_user
    # if @teacher.nil?
      # redirect_to teacher_signin_path
    # end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end
  
  def clclasses
    @teacher = session[:teacher]
    @classes = Clclass.find_by_teacher(session[:teacher].id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classes }
    end
  end
  

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end
  end
  
  def check_teacher_login
    if signed_in? && is_teacher?
      puts '--=========='
    else
      puts 'fffffff=========='
    end
  end
  private

    def signed_in_teacher
      # unless !session[:teacher].nil?
      unless signed_in?
        store_location
        redirect_to teacher_signin_path, notice: "Please sign in."
      end
    end
    
    def correct_teacher
      @teacher = Teacher.find(params[:id])
      # redirect_to(teacher_signin_path, notice: "Please sign in again.") unless session[:teacher]==@teacher
      # redirect_to(teacher_signin_path) unless session[:teacher]==@teacher
      redirect_to(teacher_signin_path) unless current_user?(@teacher)
    end
  
end
