class SessionController < ApplicationController

  def index
    @user = @current_user
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      secret = Rails.application.secrets.secret_key_base
      payload = {
        id: user.id
      }
      token = JWT.encode payload, secret, 'HS256'
      render json: {
        token: token
      }
    else
      head 401
    end
  end
end
