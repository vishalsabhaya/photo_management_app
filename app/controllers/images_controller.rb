class ImagesController < ApplicationController

  # list of images for sign in user
  def index
    @images = Image.user_wise(current_user).order_updated_at
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to images_path, notice: I18n.t('I0001')
    else
      render :new
    end
  end

  private
  # strong params for image form
  def image_params
    params.require(:image).permit(:title, :photo)
  end

end
