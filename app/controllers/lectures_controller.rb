class LecturesController < ApplicationController
  load_and_authorize_resource
  
  before_filter :clclass
  before_filter :lecture, only: [:show, :edit, :update, :destroy, :new_video]
  # GET /lectures
  # GET /lectures.json
  def index

    # @lectures = Lecture.scoped
    @lectures = Lecture.where(:clclass_id=> @clclass.id)

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: [@clclass,@lecture] }
    end
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @lectures = Lecture.where(:clclass_id=> @clclass.id)
    @exercises = Exercise.where(:lecture_id=>params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: [@clclass,@lecture] }
    end
  end

  # GET /lectures/new
  # GET /lectures/new.json
  def new
    @lecture = Lecture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lecture }
    end
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(params[:lecture])
    @lecture.clclass_id = @clclass.id

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to [@clclass,@lecture], notice: 'Lecture was successfully created.' }
        format.json { render json: [@clclass,@lecture], status: :created, location: [@clclass,@lecture] }
      else
        format.html { render action: "new" }
        format.json { render json: [@clclass,@lecture].errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lectures/1
  # PUT /lectures/1.json
  def update

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
        format.html { redirect_to [@clclass,@lecture], notice: 'Lecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [@clclass,@lecture].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    # @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to lectures_url }
      format.json { head :no_content }
    end
  end
  
  def clclass
    @clclass = Clclass.find(params[:clclass_id])
  end
  
  def new_video
    @video = Video.new

    respond_to do |format|
      format.html # new_video.html.erb
      format.json { render json: @video }
    end
  end
  #POST 
  def videos
    @video = Video.new(params[:video])
    @video.lecture_id = params[:id]
    respond_to do |format|
      if @video.save
        format.html { redirect_to [@clclass,@lecture], notice: 'Video was successfully created.' }
        format.json { render json: [@clclass,@lecture], status: :created, location: [@clclass,@lecture] }
      else
        format.html { render action: "new" }
        format.json { render json: [@clclass,@lecture].errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show_video
    @video = Video.find(params[:video_id])
  end
  def edit_video
    @video = Video.find(params[:video_id])
  end
  
  # PUT /lectures/1/10
  # PUT /lectures/1/10.json
  def update_video
    @video = Video.find(params[:video_id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to [@clclass,@lecture], notice: 'Lecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [@clclass,@lecture].errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy_video
    @video = Video.find(params[:video_id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to clclass_lecture_path(params[:clclass_id],params[:id]) }
      format.json { head :no_content }
    end
  end
  
  def lecture
    @lecture = Lecture.find(params[:id])
  end
    
end
