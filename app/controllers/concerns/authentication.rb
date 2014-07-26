module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  protected
    def login(user, persistent)
      user_session = UserSession.new(user: user)
      user_session.access(request)

      cookies[:user_session] = {
        value: user_session.key, expires: persistent ? 1.month.from_now : nil, httponly: true
      }
    end

    def logout(key = nil)
      if key.nil?
        key = cookies[:user_session]
        cookies.delete :user_session
      end

      UserSession.authenticate(key).revoke!
    end

    def user_session
      @user_session ||= UserSession.authenticate(cookies[:user_session])
    end

    def current_user
      @current_user ||= user_session.try(:user)
    end
end
