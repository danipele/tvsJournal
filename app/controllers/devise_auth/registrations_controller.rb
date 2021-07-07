module DeviseAuth
  class RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)

      resource.save
      if resource.persisted?
        expire_data_after_sign_in!
        redirect_to new_user_session_path, notice: 'an activation email was sent to your address'
      else
        clean_up_passwords resource
        set_minimum_password_length
        redirect_to new_user_registration_path, alert: resource.errors.full_messages
      end
    end
  end
end
