class UploadController < ApplicationController
  def new
    FileUtils.mkdir_p('/app/storage/cache')
    FileUtils.mkdir_p('/app/storage/myfiles')
    uploader = MyFilesUploader.new
    uploader.store!(params[:file])
    render json: {path: '/', name: uploader.url}
  end
  def delete
  end
end
