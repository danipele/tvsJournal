module DeviseAuth
  class PasswordsController < Devise::PasswordsController
    def create
      self.resource = resource_class.send_reset_password_instructions(resource_params)

      if successfully_sent?(resource)
        redirect_to new_user_session_path, notice: 'an email for password reset was sent to the address'
      else
        redirect_to new_user_password_path, alert: resource.errors.full_messages
      end
    end

    def update
      self.resource = resource_class.reset_password_by_token(resource_params)

      if resource.errors.empty?
        redirect_to new_user_session_path, notice: 'password was successfully changed'
      else
        set_minimum_password_length
        redirect_to edit_user_password_path(reset_password_token: params[:user][:reset_password_token]), alert: resource.errors.full_messages
      end
    end
  end
end
