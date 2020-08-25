class RegistrationController < Devise::RegistrationsController
  def edit
    session.delete(:otp)
    super
  end

  def update
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
    session[:otp] = val
    render json: {status: TurboSMS.get_message_status(message_id)}
  end

  def verifyphone
    @code = params[:code]
    if code == session[:otp] then
      @user = current_user
      @user.phone_verified_at = DateTime.now
      @user.save
      session.delete(:otp)
      render json: {status: 'Ok'}
    else
      render json: {status: 'wrong code'}
    end
  end

end 