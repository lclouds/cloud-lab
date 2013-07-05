class LecturesController < ApplicationController
  load_and_authorize_resource
  
  before_filter :clclass
  # GET /lectures
  # GET /lectures.json
  def index

    @lectures = Lecture.scoped

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@clclass,@lecture] }
    end
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @lecture = Lecture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
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
    @lecture = Lecture.find(params[:id])
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
    @lecture = Lecture.find(params[:id])

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
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to lectures_url }
      format.json { head :no_content }
    end
  end
  
  def clclass
    @clclass = Clclass.find(params[:clclass_id])
  end
end
