
#clclass  = cloud lab class
#can't use class as a name 
class ClclassesController < ApplicationController
  load_and_authorize_resource
  
  layout :products_layout 
  
  include ClclassesHelper
  before_filter :class_course, only: [:show, :edit]
  before_filter :class_teacher, only: [:show, :edit]
  before_filter :clclass, only: [:apply]
  # GET /clclasses
  # GET /clclasses.json
  def index
    @clclasses = Clclass.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clclasses }
    end
  end

  # GET /clclasses/1
  # GET /clclasses/1.json
  def show
    if signed_in? && applied_class?
      @user_ids = ClclassesUser.where(:clclass_id=>params[:id])
      @users = Array.new
      @user_ids.each do |u|
        @users.push(User.find(u.user_id))
      end
      @lectures = Lecture.all :joins=>:clclass
      render 'clclass'
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clclass }
    end
  end

  # GET /clclasses/new
  # GET /clclasses/new.json
  def new
    @clclass = Clclass.new
    @courses = Course.all
    @teachers = Teacher.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clclass }
    end
  end

  # GET /clclasses/1/edit
  def edit
    @courses = Course.all
    @teachers = Teacher.all
  end

  # POST /clclasses
  # POST /clclasses.json
  def create
    @clclass = Clclass.new(params[:clclass])

    respond_to do |format|
      if @clclass.save
        format.html { redirect_to @clclass, notice: 'Clclass was successfully created.' }
        format.json { render json: @clclass, status: :created, location: @clclass }
      else
        format.html { render action: "new" }
        format.json { render json: @clclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clclasses/1
  # PUT /clclasses/1.json
  def update
    @clclass = Clclass.find(params[:id])

    respond_to do |format|
      if @clclass.update_attributes(params[:clclass])
        format.html { redirect_to @clclass, notice: 'Clclass was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clclasses/1
  # DELETE /clclasses/1.json
  def destroy
    @clclass = Clclass.find(params[:id])
    @clclass.destroy

    respond_to do |format|
      format.html { redirect_to clclasses_url }
      format.json { head :no_content }
    end
  end
  
  
  # GET /clclasses/1/apply
  def apply
    if applied_class?
      # render :action => :show
      return;
    else
      puts "56789";
      @cu = ClclassesUser.new(:user_id=>current_user.id, :clclass_id=>params[:id].to_i)
      @cu.save
    end
    
    render "apply.html.erb"
  end

  
  def clclass
    if @clclass.nil?
      @clclass = Clclass.find(params[:id])
    end
  end
  def class_course
    clclass
    @course = Course.find(@clclass.course_id)
  end
  def class_user
    clclass
  end
  def class_teacher
    clclass
    @teacher = Teacher.find(@clclass.teacher)
  end
  
  private 
    def products_layout 
      is_teacher? ? "teachers" : "application" 
    end 
   
end

