class FilesController < ApplicationController
  before_action :needs_authorized, only: [:index, :create, :rename]

  def index
    files = []
    Dir.glob(File.join(Settings.upload_dir, '*')).each do |f|
      stat = readStat f
      if stat
        files.push(stat)
      end
    end
    render json: files
  end

  def create
    params[:file].each do |filename, file|
      if not file.instance_of? ActionDispatch::Http::UploadedFile
        return
      end
      File.open(File.join(Settings.upload_dir, filename), 'wb') { |f|
        f.write(file.read)
      }
    end
    head 204
  end

  def rename
    oldPath = File.join(Settings.upload_dir, params[:oldName])
    newPath = File.join(Settings.upload_dir, params[:newName])
    if not File.exist? oldPath
      head 404
      return
    end
    File.rename oldPath, newPath
    render json: readStat(newPath)
  end

  def delete
    filepath = File.join(Settings.upload_dir, params[:filename])
    if not File.exist? filepath
      head 404
      return
    end
    File.unlink filepath
    head 204
  end

  private

  def readStat(filepath)
    stat = File.stat filepath
    if not stat.file?
      return nil
    end
    {
      name: File.basename(filepath),
      size: stat.size,
      atime: stat.atime,
      ctime: stat.ctime,
      mtime: stat.mtime
    }
  end

end
