class MemosController < ApplicationController
  def index
    @memos = Memo.find()
  end
end
