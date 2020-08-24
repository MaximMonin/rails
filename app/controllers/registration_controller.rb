class RegistrationController < Devise::RegistrationsController
  def update
    super
    @user = current_user
    @user.avatar = url_for(@user.photo) if @user.photo.attached?
    @user.save
  end
end 