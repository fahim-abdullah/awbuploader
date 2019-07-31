class TripFilesController < ApplicationController
  before_action :set_trip_file, only: [:show, :edit, :update, :destroy]

  # GET /trip_files
  # GET /trip_files.json
  def index
    @trip_files = TripFile.all
  end

  # GET /trip_files/1
  # GET /trip_files/1.json
  def show
  end

  # GET /trip_files/new
  def new
    @trip_file = TripFile.new
  end

  # GET /trip_files/1/edit
  def edit
  end

  # POST /trip_files
  # POST /trip_files.json
  def create
    @trip_file = TripFile.new(trip_file_params)

    respond_to do |format|
      if @trip_file.save
        format.html { redirect_to @trip_file, notice: 'Trip file was successfully created.' }
        format.json { render :show, status: :created, location: @trip_file }
      else
        format.html { render :new }
        format.json { render json: @trip_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_files/1
  # PATCH/PUT /trip_files/1.json
  def update
    respond_to do |format|
      if @trip_file.update(trip_file_params)
        format.html { redirect_to @trip_file, notice: 'Trip file was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_file }
      else
        format.html { render :edit }
        format.json { render json: @trip_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_files/1
  # DELETE /trip_files/1.json
  def destroy
    @trip_file.destroy
    respond_to do |format|
      format.html { redirect_to trip_files_url, notice: 'Trip file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_file
      @trip_file = TripFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_file_params
      params.require(:trip_file).permit(:flight, :flight_number, :doc, :date)
    end
end
