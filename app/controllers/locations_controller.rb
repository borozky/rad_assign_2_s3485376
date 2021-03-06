class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @title = "All Locations"
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @title = "Location: #{@location.at}"
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        flash[:success] = "Location successfully updated"
        format.html { redirect_to @location, success: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        flash[:danger] = "Failed to create new location"
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        flash[:success] = "Location successfully updated"
        format.html { redirect_to @location, success: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        flash[:danger] = "Failed to update location"
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      flash[:success] = "Successfully deleted location"
      format.html { redirect_to locations_url, success: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:at)
    end
end
