class VideosController < ApplicationController
  load_and_authorize_resource
  
  before_filter :clclass
  before_filter :lecture
  # GET /lectures
  # GET /lectures.json
  def index

  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@clclass,@lecture, @video] }
    end
  end

  # GET /lectures/new
  # GET /lectures/new.json
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /lectures/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @video = Video.new(params[:video])
    # @lecture.clclass_id = @clclass.id

    respond_to do |format|
      if @video.save
        format.html { redirect_to [@clclass,@lecture,@video], notice: 'Video was successfully created.' }
        format.json { render json: [@clclass,@lecture,@video], status: :created, location: [@clclass,@lecture,@video] }
      else
        format.html { render action: "new" }
        format.json { render json: [@clclass,@lecture,@video].errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lectures/1
  # PUT /lectures/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:lecture])
        format.html { redirect_to [@clclass,@lecture,@video], notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [@clclass,@lecture,@video].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

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
      format.json { render json: @lecture }
    end
  end
  def lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
    
end
