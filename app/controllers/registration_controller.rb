class RegistrationController < Devise::RegistrationsController
  def edit
    session.delete(:otp)
    super
  end

  def update
    if not current_user.has_local_password
      params[resource_name].delete(:current_password)
    end
    super
    @user = current_user
    @user.avatar = url_for(@user.photo.variant(resize_to_limit: [300, 300]).processed) if @user.photo.attached?
    @user.save
  end

  def updatephoto
    @photo = params[:photo]
    @user = current_user
    @user.photo = @photo
    @user.save

    @user = current_user
    @user.avatar = url_for(@user.photo.variant(resize_to_limit: [300, 300]).processed) if @user.photo.attached?
    @user.save
  end

  def checkphone
    @phone = params[:phone]
    @user = current_user
    @user.phone = @phone
    @user.save

    val = rand(100000..999999)
    message_id = TurboSMS.send_sms(@phone, val)
    status = TurboSMS.get_message_status(message_id)
    session[:otp] = val
    render json: {status: status}
  end

  def verifyphone
    code = params[:otp]
    if code.to_s == session[:otp].to_s
      @user = current_user
      @user.phone_verified_at = DateTime.now
      @user.save
      session.delete(:otp)
      render json: {status: 'Ok'}
    else
      render json: {status: 'wrong code'}
    end
  end

  protected

  def update_resource(resource, params)
    if not current_user.has_local_password
      resource.update_without_password(params)
    else
      super
    end
  end

end 