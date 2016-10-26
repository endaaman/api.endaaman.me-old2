class MemosController < ApplicationController
  before_action :needs_authorized, only: [:create, :destroy]

  def index
    if @active
      query = {}
    else
      query = {draft: false}
    end

    @memos = Memo.where query
  end

  def create
    @memo = Memo.new(
      slug: params[:slug],
      title: params[:title],
      digest: params[:digest],
      hidden: params[:hidden],
      draft: params[:draft],
      image_url: params[:image_url],
      content: params[:content]
    )
    success = @memo.save
    render status: success ? 201 : 422
  end

  def update
    @memo = Memo.find_by id: params[:id]
    @memo.update(
      slug: params[:slug],
      title: params[:title],
      digest: params[:digest],
      hidden: params[:hidden],
      draft: params[:draft],
      image_url: params[:image_url],
      content: params[:content]
    )
  end

  def destroy
    Memo.destroy params[:id]
    head 204
  end

end
