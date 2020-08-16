class UserFilesController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def doc
  end
  def video
  end
  def photo
  end
end
