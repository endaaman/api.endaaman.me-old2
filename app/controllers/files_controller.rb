class FilesController < ApplicationController
  before_action :needs_authorized, only: [:index]

  def index
    files = []
    Dir.chdir(Settings.upload_dir) do
      Dir.glob('*').each do |f|
        stat = File.stat f
        if stat.file?
          files.push({
            name: f,
            size: stat.size,
            atime: stat.atime,
            ctime: stat.ctime,
            mtime: stat.mtime
          })
        end
      end
    end
    render json: files
  end

end
