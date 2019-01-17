class RecordsController < ApplicationController
  require 'open-uri'
  require 'zip/zip'
  require 'rubygems'
  require 'zip'

  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :set_timezone

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
    # @files = Record.all
    
    # render json: @records.map { |record|
    #     record.as_json.merge({ file: url_for(record.file) })
    # }

  end

  # GET /records/1
  # GET /records/1.json
  def show
    # redirect_to @record.file.service_url(filename: filename)
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def batch_download
    if params["record"].present?
      ids = params["record"].to_unsafe_h.map(&:first)

      if ids.present?
        folder = []
        input_filenames = []
        Record.where(id: ids).each do |attachment| 
          input_filenames.push("#{attachment.file.filename}")
          pre_path = "/rails/active_storage/blobs/"
          path_find = "#{rails_blob_path(attachment.file)}"
          folder.push(pre_path + path_find.split('/')[4])
        end
        container = Hash[folder.zip(input_filenames)]

        zipfile_name = "/Users/fahimabdullah/Documents/archive.zip"

        Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
          # input_filenames.each do |filename|
          container.map do |path, filename|
          zipfile.add(filename, File.join(path, filename))
          end
          zipfile.get_output_stream("myFile") { |f| f.write "myFile contains just this" }
        end
        # =====
    #     folder_path = "#{Rails.root}/public/downloads/"
    #     zipfile_name = "#{Rails.root}/public/archive.zip"

    #     FileUtils.remove_dir(folder_path) if Dir.exist?(folder_path)
    #     FileUtils.remove_entry(zipfile_name) if File.exist?(zipfile_name)
    #     Dir.mkdir("#{Rails.root}/public/downloads")

    #     Record.where(id: ids).each do |attachment|
    #       open(folder_path + "#{attachment.file.filename}", 'wb') do |file|
    #         # file << "#{(attachment.file)}"
    #         file << open("#{attachment.doc.url}").read
    #         # file << open("#{rails_blob_path(attachment.file)}").read
    #       end
    #     end

    #     input_filenames = Dir.entries(folder_path).select {|f| !File.directory? f}

    #     Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    #       input_filenames.each do |attachment|
    #         zipfile.add(attachment,File.join(folder_path,attachment))
    #       end
    #     end

    #     send_file(File.join("#{Rails.root}/public/", 'archive.zip'), :type => 'application/zip', :filename => "#{Time.now.to_date}.zip")
    #   end
    # else
    #   redirect_back fallback_location: root_path
    end
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    def set_timezone
      Time.zone = "Kuala Lumpur"
    end

    # def set_start_end_times
    #   @start_time = params[:start_time].present? ? Time.zone.parse(params[:start_time]) : Time.now - 14.day
    #   @end_time   = params[:end_time].present? ? Time.zone.parse(params[:end_time]).end_of_day : Time.now
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:awbnum, :doc)
    end
end
