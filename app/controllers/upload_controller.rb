class UploadController < ApplicationController
  def new  
    user = current_user.id
    FileUtils.mkdir_p( Rails.root.to_s + '/storage/cache')
    FileUtils.mkdir_p( Rails.root.to_s + '/storage/cdn/user' + user.to_s)

    uploader = MyFilesUploader.new
    uploader.store!(params[:file])

    mime_type = uploader.content_type
    filesize = uploader.size
    originalname = uploader.get_originalname

    # Moving files to users dir, CarrierWave cant use current_user
    filenew = URI.decode_www_form_component(uploader.url)
    filepreview = URI.decode_www_form_component(uploader.preview.url) if mime_type.start_with? 'image'
    filenew = filenew[5, filenew.length]
    filepreview = filepreview[5, filepreview.length] if filepreview.present?
    FileUtils.mv(Rails.root.to_s + '/storage/cdn/' + filenew, Rails.root.to_s + '/storage/cdn/user' + user.to_s + '/')
    FileUtils.mv(Rails.root.to_s + '/storage/cdn/' + filepreview, Rails.root.to_s + '/storage/cdn/user' + user.to_s + '/') if filepreview.present?
    filepreview = filepreview || ''

    render json: {path: '/cdn/user' + user.to_s, name: filenew, mime_type: mime_type, filesize: filesize, originalname: originalname, preview: filepreview}
  end
  def delete
    filedel = Rails.root.to_s + '/storage' + params[:file]
    File.delete(filedel) if File.exist?(filedel)
  end
end
