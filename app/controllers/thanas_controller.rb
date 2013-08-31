class ThanasController < ApplicationController
  # GET /thanas
  # GET /thanas.json
  def index
    @thanas = Thana.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thanas }
    end
  end

  # GET /thanas/1
  # GET /thanas/1.json
  def show
    @thana = Thana.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thana }
    end
  end

  # GET /thanas/new
  # GET /thanas/new.json
  def new
    @thana = Thana.new
    @districts = District.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thana }
    end
  end

  # GET /thanas/1/edit
  def edit
    @thana = Thana.find(params[:id])
  end

  # POST /thanas
  # POST /thanas.json
  def create
    @thana = Thana.new(params[:thana])

    respond_to do |format|
      if @thana.save
        format.html { redirect_to @thana, notice: 'Thana was successfully created.' }
        format.json { render json: @thana, status: :created, location: @thana }
      else
        format.html { render action: "new" }
        format.json { render json: @thana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thanas/1
  # PUT /thanas/1.json
  def update
    @thana = Thana.find(params[:id])

    respond_to do |format|
      if @thana.update_attributes(params[:thana])
        format.html { redirect_to @thana, notice: 'Thana was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thanas/1
  # DELETE /thanas/1.json
  def destroy
    @thana = Thana.find(params[:id])
    @thana.destroy

    respond_to do |format|
      format.html { redirect_to thanas_url }
      format.json { head :no_content }
    end
  end
end
