class ExercisesController < ApplicationController
  load_and_authorize_resource
  
  before_filter :clclass
  before_filter :lecture, only: [:new, :create]
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercises }
    end
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    @exercise = Exercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.lecture_id = params[:lecture_id]
    @exercise.clclass_id = params[:clclass_id]

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to [@clclass,@exercise], notice: 'Exercise was successfully created.' }
        format.json { render json: @exercise, status: :created, location: @exercise }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html { redirect_to [@clclass,@exercise], notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [@clclass,@exercise].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to clclass_exercises_path(@clclass) }
      format.json { head :no_content }
    end
  end
  
  
  def new_report
    @report = Report.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end
  
  def reports
    @report = Report.new(params[:report])
    @report.submit_time = Time.now
    @report.user_id = current_user.id
    @report.exercise_id = params[:id]
    respond_to do |format|
      if @report.save
        format.html { redirect_to show_report_clclass_exercise_path(@clclass,@exercise,@report), notice: 'Report was successfully created.' }
        format.json { render json: [@clclass,@exercise,@report], status: :created, location: [@clclass,@exercise,@report] }
      else
        format.html { render action: "new" }
        format.json { render json: [@clclass,@exercise,@report].errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show_report
    @report = Report.find(params[:report_id])
  end
  
  def show_reports
    if params[:submission]=='submission'
      @reports = Report.where(:user_id=>current_user.id, :exercise_id=>params[:id])
    else
      @reports = Report.where(:exercise_id=>params[:id])
    end
  end
  
  def destroy_report
    
    @report = Report.find(params[:report_id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to show_reports_clclass_exercise_path(@clclass,@exercise,"submission") }
      format.json { head :no_content }
    end
  end
  private
  
  def clclass
    @clclass = Clclass.find(params[:clclass_id]?params[:clclass_id]:params[:id])
  end
  def lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
end
