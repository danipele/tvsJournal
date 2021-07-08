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

    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

      if resource_updated
        redirect_to_path
      else
        clean_up_passwords resource
        set_minimum_password_length
        redirect_to edit_user_registration_path, alert: resource.errors.full_messages
      end
    end

    private

    def without_password?
      params[:user][:current_password].nil?
    end

    def resource_updated
      if without_password?
        resource.update_without_password(account_update_params)
      else
        resource.update_with_password(account_update_params)
      end
    end

    def redirect_to_path
      if without_password?
        redirect_to edit_user_registration_path, notice: 'account info updated'
      else
        redirect_to new_user_session_path, notice: 'password changed. please log in again'
      end
    end
  end
end
