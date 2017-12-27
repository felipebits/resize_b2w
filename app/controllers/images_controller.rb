class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def update_all
    image_updater = ImageUpdater.new

    if image_updater.update_all
      head 201
    else
      head 500
    end
  end
end
