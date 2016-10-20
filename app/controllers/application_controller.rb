class ApplicationController < ActionController::API
  before_action :require_login_with_token, except: :not_found

  def needs_authorized
    if not @current_user
      head 401
      return
    end
  end

  private

  def require_login_with_token
    if not request.headers[:Authorization]
      return
    end
    token_type, token = request.headers[:Authorization].split

    if token_type != 'Bearer'
      return
    end

    if not token
      return
    end

    secret = Rails.application.secrets.secret_key_base
    begin
      payload, header = JWT.decode token, secret, false
    rescue JWT::ExpiredSignature
      head 401
      return
    rescue JWT::DecodeError
      head 401
      return
    end

    @current_user = User.where(id: payload['id']).first
    @active = !!@current_user
  end



end
