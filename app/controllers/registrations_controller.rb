class RegistrationsController < Devise::RegistrationsController

  protected

  def after_inactive_sign_up_path_for(resource)
    flash[:notice] = 'an activation email was sent to your address'
    new_user_session_path
  end
end
