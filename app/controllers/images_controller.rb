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

  def tweet
    image = Image.find_by(id: params[:image_id])
    tweet_image = {
      text: image.try(:title),
      url: url_for(image.photo)
    }
    response = TweetApi.post_api(url: "#{Rails.application.secrets.site_path}/api/tweets", body: tweet_image,token: get_auth_token)
    if response.code == "201"
      redirect_to root_url, notice: I18n.t('I0002')
    else
      redirect_to root_url, error: I18n.t('E0004')
    end
  end

  private
  # strong params for image form
  def image_params
    params.require(:image).permit(:title, :photo)
  end

end
