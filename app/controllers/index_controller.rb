class IndexController < ApplicationController

  def index
    render json: {
      message: "Welcome to #{request.host}"
    }
  end
end
