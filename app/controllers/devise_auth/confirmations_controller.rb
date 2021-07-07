module DeviseAuth
  class ConfirmationsController < Devise::ConfirmationsController
    def create
      self.resource = resource_class.send_confirmation_instructions(resource_params)

      if successfully_sent?(resource)
        redirect_to new_user_session_path, notice: 'an email for account confirmation was sent to the address'
      else
        redirect_to new_user_confirmation_path, alert: resource.errors.full_messages
      end
    end
  end
end
