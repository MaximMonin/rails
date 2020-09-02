class UserFilesController < ApplicationController
  before_action :authenticate_user!
  def show
    if params[:id] == 'docs' 
      doc
    end
    if params[:id] == 'videos' 
      video 
    end
    if params[:id] == 'photos' 
      photo 
    end
    if not (params[:id] == 'photos' || params[:id] == 'videos' || params[:id] == 'docs')
      render json: 'error'
    end
  end
  def doc
    @files = UserFile.where(user_id: current_user.id).where("NOT (filetype LIKE 'image%' or filetype IN ('video/mp4', 'video/ogg', 'video/webm'))").order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
    render json: @files
  end
  def video
    @files = UserFile.where(user_id: current_user.id).where("filetype IN ('video/mp4', 'video/ogg', 'video/webm')").order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
    render json: @files
  end
  def photo
    @files = UserFile.where(user_id: current_user.id).where("filetype LIKE 'image%'").order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
    render json: @files
  end
end

