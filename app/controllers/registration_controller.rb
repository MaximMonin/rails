class RegistrationController < Devise::RegistrationsController
  def update
    super
    @user = current_user
    @user.avatar = url_for(@user.photo.variant(resize_to_limit: [300, 300]).processed) if @user.photo.attached?
    @user.save
  end
end 