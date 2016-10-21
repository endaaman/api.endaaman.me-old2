class MemosController < ApplicationController
  before_action :needs_authorized, only: [:create, :destroy]

  def index
    if @active
      query = {}
    else
      query = {draft: false}
    end

    memos = Memo.where query
    render json: memos
  end

  def create
    memo = Memo.new(
      slug: params[:slug],
      title: params[:title],
      digest: params[:digest],
      hidden: params[:hidden],
      draft: params[:draft],
      image_url: params[:image_url],
      content: params[:content]
    )
    if memo.save
      render json: memo
    else
      render json: {
        errors: memo.errors
      }
    end
  end

  def update
    memo = Memo.update(
      slug: params[:slug],
      title: params[:title],
      digest: params[:digest],
      hidden: params[:hidden],
      draft: params[:draft],
      image_url: params[:image_url],
      content: params[:content]
    )
    if memo.errors
      render json: {
        errors: memo.errors
      }
    else
      render json: memo
    end
  end

  def destroy
    Memo.destroy params[:id]
    head 204
  end

end
