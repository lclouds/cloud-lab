#clclass  = cloud lab class
#can't use class as a name 
class ClclassesController < ApplicationController
  
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
    @clclass = Clclass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clclass }
    end
  end

  # GET /clclasses/new
  # GET /clclasses/new.json
  def new
    @clclass = Clclass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clclass }
    end
  end

  # GET /clclasses/1/edit
  def edit
    @clclass = Clclass.find(params[:id])
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
    @clclass = Clclass.find(params[:id])
    render "applied"
  end

end
