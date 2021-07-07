class SessionsController < Devise::SessionsController
  def create
    catch(:warden) do
      super
      return
    end
    redirect_to new_user_session_path, alert: 'invalid email or password'
  end
end
