class UsersController < ApplicationController
  before_action :needs_authorized, only: [:index]

  def index
    @users = User.all
  end

end
