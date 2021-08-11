class PostImagesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
    @post_images = PostImage.all
    
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    
  end
  
  def destroy
    @post_image =PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  
  #投稿後のストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end